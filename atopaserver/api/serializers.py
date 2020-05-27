# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from rest_framework import serializers
from rest_framework.serializers import PrimaryKeyRelatedField
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.hashers import make_password
from django.contrib.auth import authenticate
from django.core.exceptions import ValidationError
from usuarios.models import User
from cuestionarios.models import Test, Preguntas_test
from resultados.models import Respuesta
import json

import logging
log = logging.getLogger(__name__)


class TestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Test
        fields = ['id', 'nombre', 'first']


class PreguntasTestSerializer(serializers.ModelSerializer):
    class Meta:
        model = Preguntas_test
        fields = ['test', 'pregunta']


class UserSerializer(serializers.ModelSerializer):
    test = PrimaryKeyRelatedField(many=True, queryset=Test.objects.all())

    class Meta:
        model = User
        extra_kwargs = {'password': {'write_only': True}}
        fields = ['nombre', 'apellidos',
                  'password', 'alias', 'username', 'test']


class RespuestaSerializer(serializers.ModelSerializer):
    student_username = serializers.SerializerMethodField()

    def get_student_username(self, obj):
        return obj.alumno.username

    question_id = serializers.SerializerMethodField()

    def get_question_id(self, obj):
        return obj.pregunta.pregunta.id

    respuesta_username = serializers.SerializerMethodField()

    def get_respuesta_username(self, obj):
        resp = obj.respuesta
        log.info(resp)
        j = json.dumps(resp)
        #resp_json = json.loads(j, object_hook=lambda d: {k if k.lstrip('-').isdigit() else k: v for k, v in d.items()})
        resp_json = json.loads(j)
        log.info(resp_json)
        respuesta = {}
        for e in resp_json:
            log.info(resp_json.get(e))
            if resp_json.get(e) != '' and 'text' not in e:
                alumno = User.objects.get(id=resp_json.get(e))
                respuesta[e] = alumno.username
            elif resp_json.get(e) != '' and 'text' in e:
                respuesta[e] = resp_json.get(e)
        log.info(json.dumps(respuesta))
        return json.dumps(respuesta)

    class Meta:
        model = Respuesta
        fields = ['student_username', 'question_id', 'respuesta_username']

class AuthCustomTokenSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()

    def validate(self, attrs):
        username = attrs.get('username')
        password = attrs.get('password')

        if username and password:

            user = authenticate(username=username, password=password)

            if user:
                if not user.is_active:
                    msg = _('La cuenta de usuario está desactivada.')
                    raise ValidationError(msg)
                elif not user.validado:
                    msg = _('La cuenta de usuario no está validada.')
                    raise ValidationError(msg)
            else:
                msg = _('Las credenciales no son válidas.')
                raise ValidationError(msg)
        else:
            msg = _('Debe incluir usuario y contraseña.')
            raise ValidationError(msg)

        attrs['user'] = user
        return attrs
