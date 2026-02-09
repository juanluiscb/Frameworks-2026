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
        nombre_completo += " " + self.apaterno if self.apaterno is not None else ""
        nombre_completo += " " + self.amaterno if self.amaterno is not None else ""
        return nombre_completo

    def __str__(self):
        return f'{self.nombre} - {self.email} - {self.activo}'
    
    def calcula_edad(self)->int:
        hoy = date.today()
        # Restar años
        edad = hoy.year - self.fecha_nacimiento.year
        # Verificar si aún no ha cumplido años este año
        if (hoy.month, hoy.day) < (self.fecha_nacimiento.month, self.fecha_nacimiento.day):
            edad -= 1
        return edad 
    
    def save(self,*args,**kwargs):
        self.edad = self.calcula_edad()
        super(PersonaModel,self).save(*args,**kwargs)
        
        
        