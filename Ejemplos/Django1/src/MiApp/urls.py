from django.urls import path
from MiApp.views import HolaMundo, get_fecha_hora

urlpatterns = [
    path('',HolaMundo),
    path('hora', get_fecha_hora)
]