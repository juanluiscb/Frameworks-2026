from django.contrib import admin
from MiApp.models import PersonaModel

@admin.register(PersonaModel)
class PersonaAdmin(admin.ModelAdmin):
    pass