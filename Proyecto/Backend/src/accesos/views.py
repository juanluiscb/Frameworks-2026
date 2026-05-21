from rest_framework import viewsets, status
from rest_framework.decorators import action
from rest_framework.response import Response
from .models import Invitado, Acceso
from .serializers import InvitadoSerializer, AccesoSerializer
import pyotp

class InvitadoViewSet(viewsets.ModelViewSet):
    queryset = Invitado.objects.all()
    serializer_class = InvitadoSerializer

    def get_queryset(self):
        # Si es residente, solo ve sus invitados
        if self.request.user.rol == 'RESIDENTE':
            return self.queryset.filter(residente__usuario=self.request.user)
        return self.queryset

class AccesoViewSet(viewsets.ModelViewSet):
    queryset = Acceso.objects.all()
    serializer_class = AccesoSerializer

    @action(detail=False, methods=['post'], permission_classes=[]) # Se ajustará permiso para Guardia
    def validar_qr(self, request):
        invitado_id = request.data.get('invitado_id')
        token = request.data.get('token') # El código de 6 dígitos del QR dinámico

        try:
            invitado = Invitado.objects.get(id=invitado_id, es_valida=True)
            totp = pyotp.TOTP(invitado.secreto_totp)
            
            if totp.verify(token):
                # Registrar el acceso
                Acceso.objects.create(
                    invitado=invitado,
                    tipo='ENTRADA',
                    guardia=request.user if not request.user.is_anonymous else None
                )
                return Response({'status': 'Acceso Concedido', 'invitado': invitado.nombre_completo}, status=status.HTTP_200_OK)
            else:
                return Response({'error': 'Token inválido o expirado'}, status=status.HTTP_400_BAD_REQUEST)
        except Invitado.DoesNotExist:
            return Response({'error': 'Invitación no encontrada o inactiva'}, status=status.HTTP_404_NOT_FOUND)
