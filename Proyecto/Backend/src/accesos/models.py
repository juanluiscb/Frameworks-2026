from django.db import models
from django.conf import settings
from residencial.models import Residente
import pyotp

class Invitado(models.Model):
    residente = models.ForeignKey(Residente, on_delete=models.CASCADE, related_name='invitaciones')
    nombre_completo = models.CharField(max_length=200)
    fecha_visita = models.DateField()
    secreto_totp = models.CharField(max_length=32, default=pyotp.random_base32)
    es_valida = models.BooleanField(default=True)

    def __str__(self):
        return f"Invitado: {self.nombre_completo} (Anfitrión: {self.residente.usuario.username})"

    class Meta:
        verbose_name = 'Invitado'
        verbose_name_plural = 'Invitados'

class Acceso(models.Model):
    TIPO_ACCESO = [
        ('ENTRADA', 'Entrada'),
        ('SALIDA', 'Salida'),
    ]
    invitado = models.ForeignKey(Invitado, on_delete=models.SET_NULL, null=True, blank=True)
    residente = models.ForeignKey(Residente, on_delete=models.SET_NULL, null=True, blank=True)
    fecha_hora = models.DateTimeField(auto_now_add=True)
    tipo = models.CharField(max_length=10, choices=TIPO_ACCESO)
    guardia = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, null=True, related_name='accesos_registrados')
    observaciones = models.TextField(blank=True)

    def __str__(self):
        sujeto = self.invitado.nombre_completo if self.invitado else self.residente.usuario.get_full_name()
        return f"{self.tipo} - {sujeto} - {self.fecha_hora}"

    class Meta:
        verbose_name = 'Acceso'
        verbose_name_plural = 'Accesos'
