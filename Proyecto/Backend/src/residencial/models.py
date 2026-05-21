from django.db import models
from django.conf import settings

class Casa(models.Model):
    manzana = models.CharField(max_length=50)
    lote = models.CharField(max_length=50)
    calle = models.CharField(max_length=100)
    numero_exterior = models.CharField(max_length=10)

    def __str__(self):
        return f"Mz {self.manzana} Lote {self.lote} - {self.calle}"

    class Meta:
        verbose_name = 'Casa'
        verbose_name_plural = 'Casas'

class Residente(models.Model):
    usuario = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.CASCADE, related_name='perfil_residente')
    casa = models.ForeignKey(Casa, on_delete=models.CASCADE, related_name='residentes')
    es_titular = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.usuario.get_full_name()} - {self.casa}"

    class Meta:
        verbose_name = 'Residente'
        verbose_name_plural = 'Residentes'

class Pago(models.Model):
    ESTADO_PAGO = [
        ('PENDIENTE', 'Pendiente'),
        ('PAGADO', 'Pagado'),
        ('ATRASADO', 'Atrasado'),
    ]
    residente = models.ForeignKey(Residente, on_delete=models.CASCADE, related_name='pagos')
    monto = models.DecimalField(max_digits=10, decimal_places=2)
    fecha_pago = models.DateField(auto_now_add=True)
    mes_correspondiente = models.DateField()
    estado = models.CharField(max_length=20, choices=ESTADO_PAGO, default='PENDIENTE')
    comprobante = models.FileField(upload_to='comprobantes/', blank=True, null=True)

    def __str__(self):
        return f"Pago {self.residente.usuario.username} - {self.mes_correspondiente.strftime('%B %Y')}"

    class Meta:
        verbose_name = 'Pago'
        verbose_name_plural = 'Pagos'
