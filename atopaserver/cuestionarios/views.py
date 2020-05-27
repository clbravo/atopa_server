# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.decorators import login_required

import json

from usuarios.models import User
from cuestionarios.models import Test, Preguntas_test, Pictos, PictosQuestions
from resultados.models import Respuesta

import logging
log = logging.getLogger(__name__)


@login_required
def show_test(request):
    user = User.objects.get(username=request.user)
    test = Test.objects.get(id=user.test.first().id)
    preguntas = Preguntas_test.objects.filter(test=test)
    alumnos = User.objects.exclude(username=user).exclude(is_staff=True).filter(test=test)
    alumno = User.objects.get(username=user)
    pictos = {}
    por = Pictos.objects.get(name="por qué")
    for p in preguntas:
        aux = {}
        picto = PictosQuestions.objects.filter(question_id=p.pregunta)
        for pi in picto:
            aux[pi.order] = [pi.picto.link, pi.picto.name]
        pictos[p.pregunta.tipo_pregunta] = aux
    return render(request, 'cuestionarios/test.html',
                  {'alumnos': alumnos, 'preguntas': preguntas, 'pictos':pictos, 'alumno':alumno,'por': ["por qué", por.link]})


@login_required
def recoger_respuestas(request):
    if request.method == 'POST':
        user = request.user
        test = Test.objects.get(id=user.test.first().id)
        preguntas = Preguntas_test.objects.filter(test=test)
        respuestas = json.loads(request.POST.get('respuestas'))
        respuestasOld = Respuesta.objects.filter(alumno=user)
        for re in respuestasOld:
            re.delete()
        for pregunta in preguntas:
            resp_json = respuestas[str(pregunta.pregunta.tipo_pregunta)]
            resp = Respuesta(alumno=user,
                             pregunta=pregunta,
                             respuesta=resp_json)
            resp.save()

        return redirect('logout')
