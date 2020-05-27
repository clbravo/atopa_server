# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.views import LoginView
from django.contrib.auth.decorators import login_required
from django.utils.translation import ugettext_lazy as _
from django.urls import reverse, reverse_lazy
from usuarios.forms import SignUpForm, LoginForm, LoginProfesorForm
from usuarios.models import User
from cuestionarios.models import Test

from django.core.mail import EmailMessage
from django.core.mail import send_mail
from django.conf import settings

import logging
log = logging.getLogger(__name__)


def register(request):
    if request.method == 'POST':
        form = SignUpForm(request.POST)
        if form.is_valid():
            user = form.save()
            user.is_staff = True
            user.is_active = True
            user.test.set(Test.objects.filter(nombre='Inicial'))
            user.save()
            
            #Envio de un correo a TEAVI para validar el registro del usuario
            subject = u'Registro de usuario'
            message = u'Buenos días: \n\n Se ha registrado el usuario: %s. \n Su correo es: %s. \n\n Un saludo.' % (user.username, user.email)
            email_from = settings.EMAIL_HOST_USER
            recipient_list = ['atopareg@gmail.com',]

            #sent = send_mail( subject, message, email_from, recipient_list)

            # guardarlo en la base de datos para intentar hacer el envío mas tarde
            # si después de hacer el envio varias veces, sigue sin llegar
            # deberia de avisarse al usuario 
            # TODO: Que hacer cuando el correo no se puede enviar
            # if sent is 0:  

            return redirect('/')
    else:
        form = SignUpForm()
    return render(request, 'usuarios/register.html', {'form': form})


def custom_login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)

        if form.is_valid():
            # logout(request.user)
            username = form.cleaned_data.get('username')
            if (User.objects.filter(username=username)):
                user = authenticate(username=username, password="api_user")
                login(request, user)
                return redirect('/')
    else:
        form = LoginForm()
    return render(request, 'usuarios/login.html', {'form': form})


def loginProfesor(request):
    if request.method == 'POST':
        form = LoginProfesorForm(request.POST)

        if form.is_valid():
            username = form.cleaned_data.get('username')
            password = form.cleaned_data.get('password')
            if (User.objects.filter(username=username)):
                user = authenticate(username=username, password=password)
                if user is not None:
                    login(request, user)
                    return render(request,'usuarios/profesorView.html')
                else:
                    form.get_invalid_login_error()
            else:
                form.get_invalid_login_error()
    else:
        form = LoginProfesorForm()
    return render(request, 'usuarios/loginProfesor.html', {'form': form})


@login_required(login_url='signin')
def profesorView(request):
    return render(request,'usuarios/profesorView.html')

