from django.contrib import admin
from MiApp.models import PersonaModel

@admin.register(PersonaModel)
class PersonaAdmin(admin.ModelAdmin):
    list_display = ('nombre_completo','email','activo')
    list_filter = ('genero','fecha_creacion','activo')
    list_editable = ('activo',)
    search_fields = ('nombre','apaterno','amaterno','email')

        
    
    

