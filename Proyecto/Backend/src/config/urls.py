from django.contrib import admin
from django.urls import path, include
from rest_framework import routers
from residencial.views import CasaViewSet, ResidenteViewSet, PagoViewSet
from accesos.views import InvitadoViewSet, AccesoViewSet
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView,
)

router = routers.DefaultRouter()
router.register(r'casas', CasaViewSet)
router.register(r'residentes', ResidenteViewSet)
router.register(r'pagos', PagoViewSet)
router.register(r'invitados', InvitadoViewSet)
router.register(r'accesos', AccesoViewSet)

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include(router.urls)),
    # Autenticación
    path('api/token/', TokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('api/token/refresh/', TokenRefreshView.as_view(), name='token_refresh'),
]
