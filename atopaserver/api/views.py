# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework.authtoken.models import Token
from rest_framework.generics import get_object_or_404
from usuarios.models import User, User_test
from cuestionarios.models import Test, Preguntas_test
from resultados.models import Respuesta
from api.serializers import (UserSerializer,
                             TestSerializer,
                             PreguntasTestSerializer,
                             RespuestaSerializer,AuthCustomTokenSerializer)
from rest_framework import viewsets
from rest_framework.permissions import (IsAuthenticated,
                                        IsAuthenticatedOrReadOnly)
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework.parsers import JSONParser, MultiPartParser, FormParser
from rest_framework.renderers import JSONRenderer
from django.db.models import F
import requests
import json

import logging
log = logging.getLogger(__name__)

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    permission_classes = [IsAuthenticated]

    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer

class UserView(APIView):
    permission_classes = [IsAuthenticated]
    def put(self,request):
        eva = request.data['eva']
        teacher = User.objects.get(username=request.user)
        if eva == '1':
            teacher.evaluacion = True
        else:
            teacher.evaluacion = False
        teacher.save()
        return Response({"message": "Evaluación cambiada"},status=200)


class TestViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    permission_classes = [IsAuthenticated]

    queryset = Test.objects.all().order_by('nombre')
    serializer_class = TestSerializer


class PreguntasTestViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    permission_classes = [IsAuthenticated]

    queryset = Preguntas_test.objects.all().order_by('test_id')
    serializer_class = PreguntasTestSerializer


class RespuestaViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    permission_classes = [IsAuthenticated]
    serializer_class = RespuestaSerializer

    def get_queryset(self):
        queryset = Respuesta.objects.all()
        username = self.request.query_params.get('username', None)
        if username is not None:
            log.debug(username)
            student = User.objects.get(username=username)
            log.debug(student)
            queryset = queryset.filter(alumno=student)
            log.debug(queryset)
        return queryset


class TestView(APIView):
    permission_classes = [IsAuthenticated]

    def post(self, request):
        name = request.data['nombre']
        first = request.data['first']
        test = Test()
        if first != '0':
            test.first = int(first)
        test.nombre = name
        test.save()
        usertest = User_test()
        usertest.test = test
        usertest.user = User.objects.get(username=request.user)
        usertest.save()
        content = {
            'id': str(test.pk),
        }

        return Response(content)

    def delete(self, request):
        survey = request.data['survey']
        serializer = TestSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        name = serializer.validated_data['nombre']
        test =  Test.objects.get(user_test__user__username=request.user, nombre=name)
        usersTest = User.test.through.objects.filter(test_id=test)
        teacher = User.objects.get(username=request.user)
        if teacher.evaluacion:
            if survey == "False":
                if test.first:
                    result = requests.post(
                                "https://193.146.210.219:5050/AtopaServer/api/test",
                                json={"id": test.id, "first": test.first},
                                headers={'Accept': 'application/json',
                                        'Authorization': 'Basic YXRvcGFhcHA6YXRvcGExMjNhcHA='}, verify=False)
                else:
                    result = requests.post(
                                "https://193.146.210.219:5050/AtopaServer/api/test",
                                json={"id": test.id},
                                headers={'Accept': 'application/json',
                                        'Authorization': 'Basic YXRvcGFhcHA6YXRvcGExMjNhcHA='}, verify=False)
        
            preguntas = Preguntas_test.objects.filter(test=test)
            preg = []
            for p in preguntas:
                preg.append({"test": test.id, "id": p.id, "pregunta": p.pregunta.id})
            result = requests.post(
                            "https://193.146.210.219:5050/AtopaServer/api/preguntas",
                            json=preg,
                            headers={'Accept': 'application/json',
                                    'Authorization': 'Basic YXRvcGFhcHA6YXRvcGExMjNhcHA='}, verify=False)
            alumnos = []
            answers = []
            for u in usersTest:
                student = User.objects.get(id=u.user_id)
                if not student.is_staff:
                    alumnos.append(student.username)
                    questions = []
                    answer_users = Respuesta.objects.filter(alumno=student)
                    for a in answer_users:
                        ans = {}
                        j = json.dumps(a.respuesta)
                        resp_json = json.loads(j)
                        log.info(resp_json)
                        for e in resp_json:
                            if resp_json.get(e) != '' and 'text' not in e:
                                alumno = User.objects.get(id=resp_json.get(e))
                                ans[e] = alumno.username
                            elif resp_json.get(e) != '' and 'text' in e:
                                ans[e] = resp_json.get(e)
                        questions.append({'pregunta': a.pregunta.id, 'respuesta': ans})
                    answers.append({'user': student.username, 'answers': questions})
        
            result = requests.post(
                        "https://193.146.210.219:5050/AtopaServer/api/alumnos",
                        json={"users": alumnos, "test": test.id},
                        headers={'Accept': 'application/json',
                                'Authorization': 'Basic YXRvcGFhcHA6YXRvcGExMjNhcHA='}, verify=False)
            log.info(result)
            result = requests.post(
                        "https://193.146.210.219:5050/AtopaServer/api/respuestas",
                        json=answers,
                        headers={'Accept': 'application/json',
                                'Authorization': 'Basic YXRvcGFhcHA6YXRvcGExMjNhcHA='}, verify=False)
            log.info(result)
        for u in usersTest:
            student = User.objects.get(id=u.user_id)
            if not student.is_staff:
                student.delete()
        test.delete()
        return Response({"message": "Test con nombre `{}` se ha borrado.".format(name)},status=200)

class ObtainAuthToken(APIView):
    throttle_classes = ()
    permission_classes = ()
    parser_classes = (
        FormParser,
        MultiPartParser,
        JSONParser,
    )

    renderer_classes = (JSONRenderer,)

    def post(self, request):
        serializer = AuthCustomTokenSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.validated_data['user']
        token, created = Token.objects.get_or_create(user=user)

        content = {
            'token': str(token.key),
        }

        return Response(content)
