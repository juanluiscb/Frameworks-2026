from django.urls import path,include
from rest_framework import routers

from .views import AlumnoViewSet

router = routers.DefaultRouter()
router.register(r"alumnos",AlumnoViewSet)
# router.register(r"asistencias",AsistenciaViewSet)
# router.register(r"alumnoasistencia",AlumnoAsistenciaViewSet)
urlpatterns = [
    path("", include(router.urls)),
    path("api-auth/", include("rest_framework.urls"))
]