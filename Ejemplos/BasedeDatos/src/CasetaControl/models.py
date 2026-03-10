# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models

class BitacoraAcceso(models.Model):

    class Meta:
        managed = False
        db_table = 'bitacora_acceso'


class Direccion(models.Model):
    calle = models.CharField(max_length=120)
    no_exterior = models.IntegerField()
    interior = models.IntegerField(blank=True, null=True)
    descripcion = models.CharField(max_length=200, blank=True, null=True)
    activa = models.IntegerField(blank=True, null=True)
    tipo_vivienda = models.CharField(max_length=15, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'direccion'



class QrVisita(models.Model):
    qr_generado = models.CharField(unique=True, max_length=255, blank=True, null=True)
    id_direccion = models.ForeignKey(Direccion, models.DO_NOTHING, db_column='id_direccion')
    usos_maximos = models.IntegerField(blank=True, null=True)
    usos_actuales = models.IntegerField()
    fecha_generacion = models.DateTimeField(blank=True, null=True)
    fecha_expira = models.DateField(blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'qr_visita'


class TipoVecino(models.Model):
    tipo_vecino = models.CharField(max_length=80, blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)
    descripcion = models.CharField(max_length=80, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipo_vecino'


class Vecino(models.Model):
    nombre = models.CharField(max_length=80)
    apaterno = models.CharField(max_length=80, blank=True, null=True)
    amatero = models.CharField(max_length=80, blank=True, null=True)
    email = models.CharField(max_length=120, blank=True, null=True)
    telefono = models.CharField(max_length=10, blank=True, null=True)
    tipo_vecino_id = models.IntegerField()
    fecha_creacion = models.DateTimeField(blank=True, null=True)
    fecha_modifica = models.DateTimeField(blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'vecino'


class VecinoPagaDireccion(models.Model):
    id_vecino = models.ForeignKey(Vecino, models.DO_NOTHING, db_column='id_vecino')
    id_direccion = models.ForeignKey(Direccion, models.DO_NOTHING, db_column='id_direccion')
    fecha_paga = models.DateField(blank=True, null=True)
    fecha_paga_inicio = models.DateField(blank=True, null=True)
    fecha_paga_termina = models.DateField(blank=True, null=True)
    monto = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'vecino_paga_direccion'


class Vehiculo(models.Model):
    placa = models.CharField(unique=True, max_length=6)
    marca = models.CharField(max_length=50, blank=True, null=True)
    modelo = models.IntegerField(blank=True, null=True)
    color = models.CharField(max_length=60, blank=True, null=True)
    fecha_registro = models.DateTimeField(blank=True, null=True)
    activo = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'vehiculo'
