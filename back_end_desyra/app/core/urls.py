from django.contrib import admin
from django.urls import path, include
from core_desyra.views import HealthCheck

#mi connetto alla pagina di admin esterna jet-ddmin, piu bella, sostituisco l'admin nativo di django
urlpatterns = [
    #path('jet_api/', include('jet_django.urls')),
    path('api/', include('core_desyra.api.urls_api')),
    path('health/', HealthCheck.as_view())
]
