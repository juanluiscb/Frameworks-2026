from django.contrib import admin
from MiApp.models import PersonaModel, catalogo_estados_municipios, DatosGenerales \
,PersonaDatosGenerales
from import_export.admin import ImportExportModelAdmin

@admin.register(PersonaModel)
class PersonaAdmin(admin.ModelAdmin):
    list_display = ('nombre_completo','email','activo','genero')
    search_fields = ('nombre','apaterno','amaterno',)
    list_filter = ('genero',)
    list_editable = ('activo','genero',)

@admin.register(catalogo_estados_municipios)
class CatalogoAdmin(ImportExportModelAdmin,admin.ModelAdmin):
    list_display = ('nombre_entidad','nombre_municipio','poblacion_total')
    search_fields = ('nombre_entidad','nombre_municipio')
    list_filter = ('nombre_entidad',)

@admin.register(DatosGenerales)
class DatosGeneralesAdmin(admin.ModelAdmin):
    raw_id_fields = ('estado_municipio',)

@admin.register(PersonaDatosGenerales)
class PersonaDatosGeneralesAdmin(admin.ModelAdmin):
    list_display = ('persona','datos_generales')
    raw_id_fields = ('persona','datos_generales',)