from django.contrib import admin
from .models import Invitado,Acceso

@admin.register(Invitado)
class InvitadoAdmin(admin.ModelAdmin):
    pass

@admin.register(Acceso)
class AccesoAdmin(admin.ModelAdmin):
    pass