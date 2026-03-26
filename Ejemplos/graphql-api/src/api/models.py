from django.db import models


CHOICES_GENERO=(
    ("MUJER","MUJER"),
    ("HOMBRE","HOMBRE"),
    ("OTRO","OTRO")
)

CHOICES_TIPO_ASISTENCIA=(
    ("PRESENCIAL","PRESENCIAL"),
    ("VIRTUAL","VIRTUAL")
)

class Alumno(models.Model):
    matricula = models.CharField(max_length=8)
    nombre = models.CharField(max_length=80)
    apaterno = models.CharField(max_length=80, blank=True,null=True)
    amaterno = models.CharField(max_length=80, blank=True,null=True)
    genero = models.CharField(max_length=8,choices=CHOICES_GENERO,default="OTRO")
    edad = models.IntegerField(default=0)
    email = models.EmailField(null=True,blank=True)
    activo = models.BooleanField(default=True)

    def __str__(self):
        return f'Alumno: {self.nombre} {self.apaterno} {self.amaterno} - Matricula: {self.matricula}'


class Asistencia(models.Model):
    tema_clase = models.CharField(max_length=120)
    tipo = models.CharField(max_length=20,choices=CHOICES_TIPO_ASISTENCIA,default="PRESENCIAL")
    fecha_asistencia = models.DateField()


    def __str__(self):
        return f'{self.fecha_asistencia} {self.tema_clase}'

class AlumnoAsistencia(models.Model):
    alumno = models.ForeignKey("Alumno",on_delete=models.CASCADE)
    asistencia = models.ForeignKey("Asistencia",on_delete=models.CASCADE)
    asiste = models.BooleanField(default=True)
    detalle = models.CharField(max_length=150,blank=True,null=True, help_text="Justificación de no asistencia")


    def __str__(self):
        return f'{self.alumno} {self.asistencia} {self.asiste}'