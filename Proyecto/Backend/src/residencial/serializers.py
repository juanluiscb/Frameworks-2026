from rest_framework import serializers
from .models import Casa, Residente, Pago
from usuarios.models import Usuario

class CasaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Casa
        fields = '__all__'

class ResidenteSerializer(serializers.ModelSerializer):
    nombre_completo = serializers.ReadOnlyField(source='usuario.get_full_name')
    email = serializers.ReadOnlyField(source='usuario.email')
    casa_detalle = CasaSerializer(source='casa', read_only=True)

    class Meta:
        model = Residente
        fields = ['id', 'usuario', 'nombre_completo', 'email', 'casa', 'casa_detalle', 'es_titular']

class PagoSerializer(serializers.ModelSerializer):
    residente_nombre = serializers.ReadOnlyField(source='residente.usuario.get_full_name')
    
    class Meta:
        model = Pago
        fields = '__all__'
