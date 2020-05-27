# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models
from django.utils.translation import ugettext_lazy as _
import logging

log = logging.getLogger(__name__)


class Tipo_pregunta(models.Model):
    tipo = models.CharField(max_length=3)
    descripcion = models.TextField(max_length=300, blank=True)

    def __str__(self):
        return self.tipo

class Tipo_estructura(models.Model):
    tipo = models.CharField(max_length=3)
    descripcion = models.TextField(max_length=300, blank=True)

    def __str__(self):
        return self.descripcion

class Grupo_edad(models.Model):
    grupoedad = models.CharField(max_length=30)
    franjaedad = models.CharField(max_length=5, default=0)

    def __str__(self):
        return self.grupoedad

class Pregunta(models.Model):
    pregunta = models.TextField(max_length=500, blank=False)
    tipo_estructura = models.ForeignKey(Tipo_estructura,on_delete=models.CASCADE)
    tipo_pregunta = models.ForeignKey(Tipo_pregunta,
                                      on_delete=models.CASCADE
                                      )
    grupo_edad = models.ForeignKey(Grupo_edad,
                                   on_delete=models.CASCADE)
    def __str__(self):
        return str(_(self.pregunta))


class Test(models.Model):
    nombre = models.CharField(max_length=32)
    first = models.IntegerField(null=True)
    # clase = models.ForeignKey(Clase, on_delete=models.CASCADE)

    def __str__(self):
        return str(self.id)

    def natural_key(self):
        return str(self.id)


class Preguntas_test(models.Model):
    test = models.ForeignKey(Test, on_delete=models.CASCADE,
                             blank=False)
    pregunta = models.ForeignKey(Pregunta, on_delete=models.CASCADE)

class Pictos(models.Model):
    link = models.TextField(max_length=500, blank=False)
    name = models.CharField(max_length=32)

class PictosQuestions(models.Model):
    question = models.ForeignKey(Pregunta, on_delete=models.CASCADE,
                                 blank=False)
    order = models.IntegerField(default = 1)
    picto = models.ForeignKey(Pictos, on_delete=models.CASCADE,
                              blank=False)
