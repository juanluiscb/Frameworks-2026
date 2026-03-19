from django.contrib import admin
from .models import Alumno,Asistencia,AlumnoAsistencia

@admin.register(Alumno)
class AlumnoAdmin(admin.ModelAdmin):
    pass

@admin.register(Asistencia)
class AsistenciaAdmin(admin.ModelAdmin):
    pass

@admin.register(AlumnoAsistencia)
class AlumnoAsistenciaAdmin(admin.ModelAdmin):
    pass