from django.conf.urls import url

from . import views

urlpatterns = [
    url(r'^register/', views.register, name='register'),
    url(r'^login/', views.custom_login, name='login'),
    url(r'^signin',views.loginProfesor, name ='signin'),
    url(r'^profesorView',views.profesorView, name='profesorView'),

]
