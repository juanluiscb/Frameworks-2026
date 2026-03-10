from django.contrib import admin
from .models import Vecino

@admin.register(Vecino)
class VecinoAdmin(admin.ModelAdmin):
    pass