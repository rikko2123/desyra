from django.shortcuts import get_object_or_404 #chiama un oggetto con il metodo get, se non esiste restituisce errore 404

from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response #restituisce una risposta HHTP in formato JSON

from ..models import Products, Category, Brand # importo il modello
from core_desyra.api.serializer import ProductsSerializer, CategorysSerializer, BrandSerializer #importo il serializer

#!La view è la parte del codice che riceve la richiesta HTTP (GET, POST, ecc.), la gestisce 
#!(eventualmente interagisce con il database) e restituisce una risposta JSON (grazie al serializer).


#api che mi permette di ottenere tutti i prodotti all'interno di prodotti
class ProductListCreateApiView(APIView): #classe che estende la class APIView
    #! definisco i metodi HTTP per le rchieste
    def get (self, request):
        #definisco i dati che antro a prendere(QUERY)
        products = Products.objects.all() 
        #inizializzo il serializer, ci passo la query
        serializer = ProductsSerializer(products, many=True)
        #restituisco i dati trovati
        return Response(serializer.data)
    
    def post(self, request):
        #definisco serializer
        serializer = ProductsSerializer(data=request.data)
        #verifico se i dati forniti sono validi 
        if serializer.is_valid():
            serializer.save()
            #e ritorno i dati con relativo stato HTTP
            return Response(serializer.data, status= status.HTTP_201_OK)
        return Response(serializer.error, status= status.HTTP_400_BAD_REQUEST)
        

class CategoryListApiView(APIView):
    def get(self, request):
        category = Category.objects.all() #SELECT * FROM categories;
        serializer = CategorysSerializer(category, many=True)
        return Response(serializer.data)
    
    def post(self, request):
        serializer = CategorysSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            #e ritorno i dati con relativo stato HTTP
            return Response(serializer.data, status= status.HTTP_201_OK)
        return Response(serializer.error, status= status.HTTP_400_BAD_REQUEST)
    
    
#!api for brands 
class BrandListApiView(APIView):
    def get(self, request):
        brand = Brand.objects.all() #SELECT * FROM categories;
        serializer = BrandSerializer(brand, many=True)
        return Response(serializer.data)
    
    def post(self, request):
        serializer = BrandSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            #e ritorno i dati con relativo stato HTTP
            return Response(serializer.data, status= status.HTTP_201_OK)
        return Response(serializer.error, status= status.HTTP_400_BAD_REQUEST)
    
#!api for prodotti per marca
#SELECT * FROM brand inner join product using(id_brand) broup by brand.id_brand
class BrandProductListApiView(APIView):
    def get(self, request):
        #prendo tutti i prodotti che sono associati ad un nome brand 
        brand_product = Brand.objects.prefetch_related('products').all()
        serializer = BrandSerializer(brand_product, many=True)
        return Response(serializer.data)
    
    