# -*- coding: utf-8 -*-
from django.contrib.auth.forms import AuthenticationForm, UserCreationForm
from django.contrib.auth import authenticate
from django.utils.translation import ugettext_lazy as _
from django import forms
from django.utils.translation import ugettext, gettext
from django.contrib.auth.forms import SetPasswordForm
from .models import User
from django.core.exceptions import ValidationError

import logging
import re
log = logging.getLogger(__name__)


class LoginForm(forms.Form):
    username = forms.CharField(max_length=30)

    class Meta:
        model = User
        fields = ('username')

    def __init__(self, *args, **kwargs):
        super(LoginForm, self).__init__(*args, **kwargs)
        self.fields['username'].label = gettext('Código')

    def clean_username(self):
        username = self.cleaned_data['username']
        if username:
            if username != '':
                if not User.objects.filter(username=username).exists():
                    raise ValidationError(gettext('Ese código no es válido'))
        return username


class SignUpForm(UserCreationForm):
    nombre = forms.CharField(max_length=30,
                             required=True, help_text=gettext('Obligatorio'),widget=forms.TextInput(attrs={'onchange': 'changename();'}))
    apellidos = forms.CharField(max_length=30,
                                required=True, help_text=gettext('Obligatorio'),widget=forms.TextInput(attrs={'onchange': 'changename();'}))
    email = forms.EmailField(max_length=254,
                             help_text=gettext('Obligatorio. Introduzca una dirección de correo válida'))
    email_colegio = forms.EmailField(max_length=254,
                             help_text=gettext('Obligatorio. Introduzca una dirección de correo válida'))
    colegio = forms.CharField(max_length=254, help_text=gettext('Obligatorio'))
    DNI = forms.CharField(max_length=254, help_text=gettext('Obligatorio'),widget=forms.TextInput(attrs={'onchange': 'changedni();'}))
    evaluacion = forms.BooleanField(required=False,initial=False, label=ugettext('Voy a participar en la evaluación de la aplicación ATOPA'))


    class Meta:
        model = User
        fields = ('username', 'nombre', 'apellidos',
                  'email', 'DNI', 'colegio', 'email_colegio','password1', 'password2','evaluacion',)

    def __init__(self, *args, **kwargs):
        super(SignUpForm, self).__init__(*args, **kwargs)
        self.fields['username'].help_text = gettext('Obligatorio. 150 caracteres como máximo. Únicamente letras, dígitos y @, ., +, -, _')
        self.fields['password1'].help_text = gettext('8 caracteres como mínimo. Debe tener letras y dígitos')
        self.fields['password2'].help_text = gettext('Para verificar, introduzca la misma contraseña anterior')

    def clean_email(self):
        email = self.cleaned_data['email']
        if email:
            if email != '':
                if User.objects.filter(email=email).exists():
                    raise ValidationError(gettext('Ya existe un usuario con ese email'))
        return email

    def clean_DNI(self):
        dni = self.cleaned_data['DNI']
        if dni:
            if dni != '':
                pattern = re.compile("^([0-9]{8})[A-Za-z]{1}$")
                if not pattern.match(dni):
                    raise ValidationError(ugettext('El formato del DNI no es correcto'))
                if User.objects.filter(DNI=dni).exists():
                    raise ValidationError(gettext('Ya existe un usuario con ese DNI'))
        return dni

    def clean_username(self):
        username = self.cleaned_data['username']
        if username:
            if username != '':
                if len(username) > 150:
                    raise ValidationError(gettext('El nombre de usuario es demasiado largo'))
            else:
                raise ValidationError(gettext('Este campo es requerido'))
        else:
            raise ValidationError(gettext('Este campo es requerido'))
        return username

    def clean_password1(self):
        password1 = self.cleaned_data['password1']
        if password1:
            if password1 != '':
                if len(password1) < 8:
                    raise ValidationError(gettext('La contraseña es demasiado corta'))
        return password1

class PasswordForm(SetPasswordForm):

    def __init__(self, user, *args, **kwargs):
        super(SetPasswordForm, self).__init__(*args, **kwargs)
        self.fields['new_password1'].help_text = gettext('8 caracteres como mínimo. Debe tener letras y dígitos')
        self.fields['new_password2'].help_text = gettext('Para verificar, introduzca la misma contraseña anterior')

    def clean_password1(self):
        password1 = self.cleaned_data['new_password1']
        if password1:
            if password1 != '':
                if len(password1) < 8:
                    raise ValidationError(gettext('La contraseña es demasiado corta'))
        return password1


class LoginProfesorForm(forms.Form):
    username = forms.CharField(max_length=30)
    password = forms.CharField(
        label=_("Password"),
        strip=False,
        widget=forms.PasswordInput(attrs={'autocomplete': 'current-password'}),
    )

    error_messages = {
        'invalid_login': _(
            "Please enter a correct %(username)s and password. Note that both "
            "fields may be case-sensitive."
        ),
        'inactive': _("This account is inactive."),
    }

    class Meta:
        model = User
        fields = ('username','password')

    def __init__(self, *args, **kwargs):
        super(LoginProfesorForm, self).__init__(*args, **kwargs)
        self.fields['username'].help_text = gettext('Obligatorio.')
        self.fields['password'].help_text = gettext('Obligatorio.')

    def clean_username(self):
        username = self.cleaned_data['username']
        if username:
            if username == '':
                raise ValidationError(gettext('Este campo es requerido'))
        else:
            raise ValidationError(gettext('Este campo es requerido'))
        return username

    def clean_password(self):
        password = self.cleaned_data['password']
        if password:
            if password == '':
                raise ValidationError(gettext('Este campo es requerido'))
        else:
                raise ValidationError(gettext('Este campo es requerido'))

        return password

    def get_invalid_login_error(self):
        username = self.cleaned_data['username']
        self.add_error(None,gettext('Por favor, introduzca un nombre de usuario y clave correctos. Observe que ambos campos pueden ser sensibles a mayúsculas'))

