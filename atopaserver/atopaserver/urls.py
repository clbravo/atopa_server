"""atopaserver URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin

from rest_framework import routers
from api import views
from django.views.generic import TemplateView
from django.contrib.auth.views import LoginView, LogoutView
from usuarios.forms import LoginForm
import os
from rest_framework.authtoken.views import obtain_auth_token

router = routers.DefaultRouter()
router.register(r'users', views.UserViewSet)
router.register(r'tests', views.TestViewSet)
router.register(r'preguntastests', views.PreguntasTestViewSet)
router.register(r'respuestas', views.RespuestaViewSet, basename='Respuesta')
PROJECT_DIR = os.path.dirname(__file__)
urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url(r'^login/$', LoginView.as_view(),
        {'authentication_form': LoginForm}),
    url('api/', include(router.urls)),
    url('api-token-auth/', views.ObtainAuthToken.as_view(), name='api_token_auth'),
    url(r'^accounts/logout/$',
        LogoutView.as_view(),
        {'next_page': '/'}),
    url(r'^accounts/', include('django.contrib.auth.urls')),
    url(r'^usuarios/', include('usuarios.urls')),
    url(r'^i18n/', include('django.conf.urls.i18n')),
    url(r'', include('cuestionarios.urls')),
    url('api/test/', views.TestView.as_view(), name='test')
]
