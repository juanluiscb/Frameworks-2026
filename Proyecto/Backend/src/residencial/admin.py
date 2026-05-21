from django.contrib import admin
from .models import Casa,Residente,Pago

@admin.register(Casa)
class CasaAdmin(admin.ModelAdmin):
    pass

@admin.register(Residente)
class ResidenteAdmin(admin.ModelAdmin):
    pass

@admin.register(Pago)
class PagoAdmin(admin.ModelAdmin):
    pass