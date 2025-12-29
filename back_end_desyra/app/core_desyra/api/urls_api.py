from django.urls import path
#importo le view api
from .views_api import ProductListCreateApiView, CategoryListApiView, BrandListApiView, BrandProductListApiView

#!In questo file creo gli end-point api 
#!Ogni end-point creato deve essere inserito al'interno della pagina di urls principale

urlpatterns = [
    path(
        'products/',
        ProductListCreateApiView.as_view(),
        name='products-list'
    ),
    
    path(
        'category/',
        CategoryListApiView.as_view(),
        name='category'
    ),
    
    path(
        'brand/',
        BrandListApiView.as_view(),
        name='brand'
    ),
    path(
        'brand-product/',
        BrandProductListApiView.as_view(),
        name='brand'
    ),
]
