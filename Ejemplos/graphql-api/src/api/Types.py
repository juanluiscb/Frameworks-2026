import graphene
from graphene_django import DjangoObjectType
from .models import Alumno,Asistencia,AlumnoAsistencia

class AlumnoType(DjangoObjectType):
    class Meta:
        model = Alumno

class AsistenciaType(DjangoObjectType):
    class Meta:
        model = Asistencia

class AlumnoAsistenciaType(DjangoObjectType):
    class Meta:
        model = AlumnoAsistencia