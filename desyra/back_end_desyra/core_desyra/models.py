from django.db import models
from django.db.utils import OperationalError
# Create your models here.



class Shipping_address(models.Model):
    id_address = models.AutoField(primary_key=True)
    street_address = models.CharField(max_length=500)
    city = models.CharField(max_length=20, default="Roma")
    postal_code = models.CharField(max_length=5)
    province = models.CharField(max_length = 2)
    country = models.CharField(max_length=20)
    is_default = models.BooleanField(default=True)
    #prendo data creazione/modifica record
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.street_address
    
class Brand(models.Model):
    id_brand = models.AutoField(primary_key=True)
    name = models.CharField(max_length=50)
    description = models.TextField(max_length=5000)
    logo_path = models.ImageField(upload_to="") #da inserirew path immagini
    web_site = models.URLField(max_length=100)
    is_active = models.BooleanField(default=True)
    
    def __str__(self):
        return self.name
    
class Shipping(models.Model):
    id_shipping = models.AutoField(primary_key=True)
    tracking_code = models.CharField(max_length=30)
    courier = models.CharField(max_length=50)
    
    #rendo possibile l'assuzione solo di questi valori del campo status
    STATUS_CHOICES = [
        ('pending', 'In attesa'),
        ('shipped', 'Spedito'),
        ('in_transit', 'In transito'),
        ('delivered', 'Consegnato'),
        ('cancelled', 'Cancellato'),
    ]
    status = models.CharField(max_length=50, choices=STATUS_CHOICES, default=STATUS_CHOICES[0])
    shipping_at = models.DateField()
    delivered_at = models.DateField()
    shipping_cost = models.DecimalField(max_digits=6, decimal_places=2, default=0)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.tracking_code
    
class Chart(models.Model):
    id_chart = models.AutoField(primary_key=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.id_chart
    
class Wishlist(models.Model):
    id_wishlist = models.AutoField(primary_key=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.id_wishlist
    
class Users(models.Model):
    id_user = models.AutoField(primary_key=True)
    shipping_address = models.ForeignKey(Shipping_address, on_delete=models.CASCADE, db_column='id_address')
    wishlist = models.OneToOneField(Wishlist, on_delete=models.CASCADE, db_column='id_wishlist')
    chart = models.OneToOneField(Chart, on_delete=models.CASCADE, db_column='id_chart')
    name = models.TextField(max_length=50)
    surname = models.TextField(max_length=50)
    email = models.EmailField()
    password = models.CharField(max_length=128)  # attenzione: devi salvare un hash, non la password in chiaro
    
    ROLE = [
        ('admin', 'amministratore'),
        ('costumer', 'cliente'),
    ]
    role = models.CharField(max_length=50, choices=ROLE, default=ROLE[1])
    
    date_joined = models.DateTimeField(auto_now_add=True)
    username = models.CharField(max_length=50)
    phone = models.CharField(max_length=20)
    birth_date = models.DateField()
    
    GENDER = [
        ('male', 'maschio'),
        ('female', 'femmina')
    ]
    gender = models.CharField(max_length=50, choices=GENDER)
    
    news_letter = models.BooleanField(default=False)
    is_active = models.BooleanField(default=True)
    sing_up_ip = models.GenericIPAddressField()
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.name
    
class Products(models.Model):
    id_product = models.AutoField(primary_key=True)
    id_brand = models.ForeignKey(Brand, on_delete=models.CASCADE, db_column="id_brand", related_name='brand')
    name = models.CharField(max_length=50)
    short_desc = models.CharField(max_length= 250)
    desc = models.TextField(max_length=1000)
    price = models.DecimalField(max_digits=4, decimal_places= 2)
    discount_price = models.DecimalField(max_digits=4, decimal_places= 2)
    code = models.CharField(max_length=20, unique=True)
    stock_aviability = models.IntegerField()
    is_active = models.BooleanField(default=True)
    is_featured = models.BooleanField(default=False) #campo che mi permette di gestire la visibilità del campo
    created_ad = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.name

class Variants(models.Model):
    id_variant = models.AutoField(primary_key=True)
    product = models.ForeignKey(Products, on_delete=models.CASCADE, db_column='id_product', related_name='variant')
    cod_variant = models.CharField(max_length=20, unique=True)
    price = models.DecimalField(max_digits=4, decimal_places= 2)
    discount_price = models.DecimalField(max_digits=4, decimal_places= 2)
    stock_aviability = models.IntegerField()
    created_ad = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    def __str__(self):
        return self.cod_variante

class Img_prod(models.Model):
    id_img = models.AutoField(primary_key=True)
    product = models.ForeignKey(Products, on_delete=models.CASCADE, db_column='id_product', related_name='images')
    alt_text = models.CharField(max_length=15)
    is_main_img = models.BooleanField(default=False)
    created_ad = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    img_path = models.ImageField(upload_to= "") #da inserirew path immagini
    

class Category(models.Model):
    id_category = models.AutoField(primary_key=True)
    #product = models.ForeignKey(Products, on_delete=models.CASCADE, db_column='id_product', related_name='products')
    name = models.CharField(max_length=50)
    short_desc = models.CharField(max_length= 250)
    desc = models.TextField(max_length=1000)
    
    #creo sotto-categorie
    parent = models.ForeignKey(
        'self',                  # riferisce alla stessa tabella
        on_delete=models.CASCADE,
        null=True,               # la categoria principale non ha genitore
        blank=True,
        related_name='children'  # permette .children.all() per trovare le sottocategorie
    )
    
    def __str__(self):
        return self.name
    
#! da verificare 
class Chart_Products(models.Model):
    chart = models.ForeignKey(Chart, on_delete=models.CASCADE, db_column='id_chart', related_name='items')
    product = models.ForeignKey(Products, on_delete=models.CASCADE, db_column='id_product', related_name='product_chart')
    quantitaty = models.IntegerField()
    price_snapshot = models.DecimalField(max_digits=4, decimal_places= 2)
    added_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        unique_together = ('chart', 'product')  # imposta combinazione univoca


class Wishlist_Products(models.Model):
    wishlist = models.ForeignKey(Wishlist, on_delete=models.CASCADE, db_column='id_wishlist', related_name='items')
    product = models.ForeignKey(Products, on_delete=models.CASCADE, db_column='id_product', related_name='product')
    quantitaty = models.IntegerField()
    price_snapshot = models.DecimalField(max_digits=4, decimal_places= 2)
    added_at = models.DateTimeField(auto_now_add=True)
    
    class Meta:
        unique_together = ('wishlist', 'product')  # imposta combinazione univoca

class Category_Products(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, db_column='id_category', related_name='category_products')
    product = models.ForeignKey(Products, on_delete=models.CASCADE, db_column='id_product', related_name='product_categories')
    
    class Meta:
        unique_together = ('category', 'product')  # evita duplicati
    

class Order(models.Model):
    id_order = models.AutoField(primary_key=True)
    user = models.ForeignKey(Users, on_delete=models.CASCADE, db_column='id_user', related_name='order')
    #product = models.ForeignKey(Products, on_delete=models.CASCADE, db_column='id_product', related_name='product')
    shipping = models.OneToOneField(Shipping, on_delete=models.CASCADE, db_column='id_shipping', related_name='shipment')
    address = models.ForeignKey(Shipping_address, on_delete=models.CASCADE, db_column='id_address', related_name='address')
    
    #stato pagamento
    status = models.CharField(
        max_length=30,
        choices=[
            ('pending', 'In attesa'),
            ('paid', 'Pagato'),
            ('shipped', 'Spedito'),
            ('delivered', 'Consegnato'),
            ('cancelled', 'Annullato'),
        ],
        default='pending'
    )
    
    payment_method = models.CharField(max_length=30)  # es: carta, bonifico, paypal
    
    payment_status = models.CharField(
        max_length=30,
        choices=[('unpaid', 'Non pagato'), ('paid', 'Pagato')],
        default='unpaid'
    )
    total_amount = models.DecimalField(max_digits=10, decimal_places=2)
    tax = models.DecimalField(max_digits=6, decimal_places=2, default=0)
    notes = models.TextField(blank=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
class OrderItem(models.Model):
    order = models.ForeignKey(Order, on_delete=models.CASCADE, db_column='id_order', related_name='items')
    product = models.ForeignKey(Products, on_delete=models.SET_NULL, null=True)
    quantity = models.IntegerField()
    price_each = models.DecimalField(max_digits=8, decimal_places=2)