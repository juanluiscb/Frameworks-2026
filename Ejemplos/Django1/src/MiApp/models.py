from django.db import models
from datetime import date

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

    def nombre_completo(self):
        nombre_completo = self.nombre
        if self.apaterno is not None:
            nombre_completo += " "+self.apaterno
        if self.amaterno is not None:
            nombre_completo += " "+self.amaterno
        return nombre_completo


    def __str__(self)->str:
        return f'{self.nombre} {self.apaterno} {self.amaterno}'
    
    def calcula_edad(self):
        hoy = date.today()
        edad = hoy.year - self.fecha_nacimiento.year
        if (hoy.month, hoy.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day):
            edad -= 1
        return edad
    
    def save(self, *args, **kwargs):
        self.edad = self.calcula_edad()
        super(PersonaModel,self).save(*args,**kwargs)

class catalogo_estados_municipios(models.Model):
    clave_entidad = models.IntegerField()	
    nombre_entidad = models.CharField(max_length=120)	
    clave_municipio	= models.IntegerField()
    nombre_municipio = models.CharField(max_length=120)	
    poblacion_total = models.BigIntegerField()


# class DatosGenerales(models.Model):
#     direccion = models.TextField()
#     cp = models.IntegerField(verbose_name='Código Postal')
#     estado_municipio = models.ForeignKey()