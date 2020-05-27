# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django_mysql.models import JSONField, Model

from cuestionarios.models import Preguntas_test
from usuarios.models import User


class Respuesta(Model):
    alumno = models.ForeignKey(User,
                               on_delete=models.CASCADE, null=True, blank=True)
    pregunta = models.ForeignKey(Preguntas_test,
                                 on_delete=models.CASCADE)
    respuesta = JSONField()
