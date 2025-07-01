from rest_framework import serializers
from ..models import Products

#! Nel serializer definisci quale modello (tabella) vuoi serializzare e quali campi vuoi esporre

class ProductsSerializer(serializers.ModelSerializer):
    #all'interno del tag meta specifico il nome della tabella di cui voglio ottenere i dati
    #i campi che voglio usare 
    class Meta:
        model = Products
        fields = '__all__'