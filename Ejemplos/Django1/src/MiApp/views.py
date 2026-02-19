from django.shortcuts import render, HttpResponse
from datetime import datetime
from MiApp.models import PersonaModel, PersonaDatosGenerales
from django.contrib.auth.decorators import login_required
def HolaMundo(request):
    contexto = {
        'title': ':: Bienvenidos todos'
    }
    return render(request,'main/base.html',contexto)

def get_fecha_hora(request):
    return HttpResponse(datetime.now())

def ListaPersonas(request):
    listaPersonas = PersonaModel.objects.all()
    contexto = {
        'title': ':: Lista de Personas - hola',
        'listaPersonas': listaPersonas
    }
    return render(request,'miapp/ListaPersonas.html',contexto)

@login_required(login_url='/admin')
def DatosGenerales(request,persona_id):
    datosPerDetallePersonasona = PersonaDatosGenerales.objects.get(persona_id=persona_id)
    contexto = {
        'title': ':: Datos Generales Por Persona',
        'datosPersona': datosPerDetallePersonasona
    }
    return render(request, 'miapp/DatosGeneralesPersona.html',contexto)