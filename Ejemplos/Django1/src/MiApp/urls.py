from django.urls import path
from MiApp.views import HolaMundo, get_fecha_hora
from MiApp import views
urlpatterns = [
    path('',HolaMundo),
    path('hora', get_fecha_hora),

    path('ListaPersonas', views.ListaPersonas),
    path('<int:persona_id>/DatosGenerales',views.DatosGenerales, name='datos-generales')



]