from django.shortcuts import get_object_or_404 #chiama un oggetto con il metodo get, se non esiste restituisce errore 404

from rest_framework import status
from rest_framework.views import APIView
from rest_framework.response import Response

from ..models import Products # importo il modello
from core_desyra.api.serializer import ProductsSerializer #importo il serializer

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
        
    

