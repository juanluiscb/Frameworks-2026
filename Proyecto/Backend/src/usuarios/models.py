from django.db import models
from django.contrib.auth.models import AbstractUser

class Usuario(AbstractUser):
    ROL_OPCIONES = [
        ('ADMIN', 'Administrador'),
        ('GUARDIA', 'Guardia de Seguridad'),
        ('RESIDENTE', 'Residente'),
    ]
    rol = models.CharField(max_length=20, choices=ROL_OPCIONES, default='RESIDENTE')
    telefono = models.CharField(max_length=15, blank=True, null=True)

    def __str__(self):
        return f"{self.username} - {self.get_rol_display()}"

    class Meta:
        verbose_name = 'Usuario'
        verbose_name_plural = 'Usuarios'
d