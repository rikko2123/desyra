from rest_framework import serializers
from ..models import Products, Category, Brand, Img_prod

#! Nel serializer definisci quale modello (tabella) vuoi serializzare e quali campi vuoi esporre, serve per convertire oggetti python in json

# Se vuoi includere i dati di un'altra tabella 
# (cioè di un altro modello collegato da una relazione, 
# tipo ForeignKey), e serializzare tutto insieme 
# in un'unica risposta, allora devi importare e usare il serializer 
# "figlio" all'interno del serializer "genitore
#!usa lo stesso nome del realted name quando istanzi un serializer
        
class ImgSerializer(serializers.ModelSerializer):
    class Meta: 
        model = Img_prod
        fields = '__all__'

class ProductsSerializer(serializers.ModelSerializer):
    #all'interno del tag meta specifico il nome della tabella di cui voglio ottenere i dati
    #i campi che voglio usare  
    #sggiungo il serializer delle immagini
    images = ImgSerializer(many = True, read_only = True)
    class Meta:
        model = Products
        fields = '__all__'
        
class BrandSerializer(serializers.ModelSerializer):
    #serializer figlio 
    products = ProductsSerializer(many=True, read_only=True)
    class Meta:
        model = Brand
        fields = '__all__'
        
class CategorysSerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = ['id_category', 'name', 'short_desc', 'desc']
        