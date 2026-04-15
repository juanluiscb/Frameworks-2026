from django.urls import path,include
from rest_framework import routers

from .views import AlumnoViewSet

router = routers.DefaultRouter()
# listaAlumnos = AlumnoViewSet.as_view({'get':'list'})
router.register(r"alumnos",AlumnoViewSet,basename='alumnos')
# router.register(r"asistencias",AsistenciaViewSet)
# router.register(r"alumnoasistencia",AlumnoAsistenciaViewSet)
urlpatterns = [
    path("", include(router.urls)),
    # path("ListaAlumnos",listaAlumnos),
    path("api-auth/", include("rest_framework.urls"))
]