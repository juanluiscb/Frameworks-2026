from django.shortcuts import render
from rest_framework import viewsets
from .models import Alumno,Asistencia,AlumnoAsistencia
from .serializers import AlumnoSerilizer

class AlumnoViewSet(viewsets.ModelViewSet):
    queryset = Alumno.objects.all()
    serializer_class = AlumnoSerilizer