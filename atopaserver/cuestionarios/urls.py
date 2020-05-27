from django.conf.urls import url

from cuestionarios import views

urlpatterns = [
    url(r'^recoger_respuestas',
        views.recoger_respuestas,
        name='recoger_respuestas'),
    url(r'^$', views.show_test, name='test')
]
