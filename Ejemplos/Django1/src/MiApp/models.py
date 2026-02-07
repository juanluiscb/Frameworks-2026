from django.db import models

CHOICES_GENERO = (
    ("Mujer","Mujer"),
    ("Hombre","Hombre"),
    ("Otro","Otro")
)

class PersonaModel(models.Model):
    nombre = models.CharField(max_length=80, verbose_name="Nombre(s)")
    apaterno = models.CharField(max_length=80,null=True,blank=True, verbose_name="Apellido Paterno")
    amaterno = models.CharField(max_length=80,null=True,blank=True, verbose_name="Apellido Materno")
    genero = models.CharField(max_length=8, choices=CHOICES_GENERO,default="Otro")
    email = models.EmailField()
    fecha_nacimiento = models.DateField()
    edad = models.IntegerField(default=0)
    altura = models.DecimalField(decimal_places=2,max_digits=3)
    red_social = models.URLField()
    imagen_perfil = models.ImageField()
    activo = models.BooleanField(default=True)
    fecha_creacion = models.DateTimeField(auto_created=True,auto_now_add=True)
    fecha_modifica = models.DateTimeField(auto_now=True)