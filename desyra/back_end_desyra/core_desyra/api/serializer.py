from rest_framework import serializers
from ..models import Products, Category

#! Nel serializer definisci quale modello (tabella) vuoi serializzare e quali campi vuoi esporre, serve per convertire oggetti python in json

class ProductsSerializer(serializers.ModelSerializer):
    #all'interno del tag meta specifico il nome della tabella di cui voglio ottenere i dati
    #i campi che voglio usare 
    class Meta:
        model = Products
        fields = '__all__'
        
class CategorysSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id_category', 'name', 'short_desc', 'desc']