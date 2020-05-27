# -*- coding: utf-8 -*-

from __future__ import unicode_literals

from django.db import models

# from django.contrib.auth.models import User

from django.contrib.auth.models import PermissionsMixin
from django.contrib.auth.base_user import AbstractBaseUser
from django.utils.translation import ugettext_lazy as _

from .managers import UserManager
from cuestionarios.models import Test


class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(_('email address'), blank=True)
    email_colegio =  models.EmailField(_('email address colegio'), blank=True)
    username = models.CharField(max_length=255, unique=True, blank=True)
    nombre = models.CharField(_('nombre'), max_length=30, blank=True)
    apellidos = models.CharField(_('apellidos'), max_length=60, blank=True)
    date_joined = models.DateTimeField(_('date joined'), auto_now_add=True)
    alias = models.CharField(max_length=30, blank=True)
    DNI = models.CharField(max_length=10, blank=True)
    colegio = models.CharField(max_length=100, null=True)
    is_staff = models.BooleanField(default=False)
    test = models.ManyToManyField(Test, related_name='tests', through='User_test', through_fields=('user','test'))
    validado = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    evaluacion = models.BooleanField(default = False)
    objects = UserManager()

    USERNAME_FIELD = 'username'
    REQUIRED_FIELDS = ['nombre', 'apellidos']

    def get_test(self):
        return self.test

    def get_short_name(self):
        return self.nombre

class User_test(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    test = models.ForeignKey(Test, on_delete=models.CASCADE)

    class Meta:
        unique_together = ('user', 'test')