from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Usuario

@admin.register(Usuario)
class UsuarioAdmin(UserAdmin):
    # Campos que se mostrarán en la lista del admin
    list_display = ('username', 'email', 'first_name', 'last_name', 'rol', 'is_staff')
    # Filtros laterales
    list_filter = ('rol', 'is_staff', 'is_superuser', 'is_active')
    
    # Configuración de los campos al editar un usuario
    fieldsets = UserAdmin.fieldsets + (
        ('Información Adicional', {'fields': ('rol', 'telefono')}),
    )
    
    # Configuración de los campos al crear un usuario
    add_fieldsets = UserAdmin.add_fieldsets + (
        ('Información Adicional', {'fields': ('rol', 'telefono')}),
    )