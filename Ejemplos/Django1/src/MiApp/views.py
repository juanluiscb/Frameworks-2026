from django.shortcuts import render, HttpResponse
from datetime import datetime
from MiApp.models import PersonaModel, PersonaDatosGenerales

def HolaMundo(request):
    return HttpResponse("Hola Mundo cruel y despiadado")

def get_fecha_hora(request):
    return HttpResponse(datetime.now())

def ListaPersonas(request):
    listaPersonas = PersonaModel.objects.all()
    contexto = {
        'title': ':: Lista de Personas',
        'listaPersonas': listaPersonas
    }
    return render(request,'main/base.html',contexto)

def DatosGenerales(request,persona_id):
    datosPersona = PersonaDatosGenerales.objects.get(persona_id=persona_id)
    return HttpResponse(datosPersona)