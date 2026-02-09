from django.shortcuts import render, HttpResponse
from datetime import datetime

def HolaMundo(request):
    return HttpResponse("Hola Mundo cruel y despiadado")

def get_fecha_hora(request):
    return HttpResponse(datetime.now())