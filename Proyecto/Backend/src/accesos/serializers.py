from rest_framework import serializers
import pyotp
from .models import Invitado, Acceso
from residencial.serializers import ResidenteSerializer

class InvitadoSerializer(serializers.ModelSerializer):
    qr_uri = serializers.SerializerMethodField()

    class Meta:
        model = Invitado
        fields = ['id', 'residente', 'nombre_completo', 'fecha_visita', 'es_valida', 'qr_uri']
        read_only_fields = ['secreto_totp']

    def get_qr_uri(self, obj):
        # Genera la URI compatible con Google Authenticator/Lector QR
        totp = pyotp.TOTP(obj.secreto_totp)
        return totp.provisioning_uri(
            name=obj.nombre_completo, 
            issuer_name="Fraccionamiento Privado"
        )

class AccesoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Acceso
        fields = '__all__'
