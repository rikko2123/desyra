from django.urls import path
#importo le view api
from .views_api import ProductListCreateApiView

#!In questo file creo gli end-point api 
#!Ogni end-point creato deve essere inserito al'interno della pagina di urls principale

urlpatterns = [
    path(
        'products/',
        ProductListCreateApiView.as_view(),
        name='products-list'
    )
]
