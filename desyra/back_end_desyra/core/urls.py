"""
URL configuration for core project.
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

#mi connetto alla pagina di admin esterna jet-ddmin, piu bella, sostituisco l'admin nativo di django
urlpatterns = [
    #path('jet_api/', include('jet_django.urls')),
    path('api/', include('core_desyra.api.urls_api'))
]
