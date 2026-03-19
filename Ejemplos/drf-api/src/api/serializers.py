from rest_framework import serializers
from .models import Alumno, Asistencia,AlumnoAsistencia

class AlumnoSerilizer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Alumno
        fields = ["matricula","nombre","apaterno","amaterno","edad","email","genero","activo"]
