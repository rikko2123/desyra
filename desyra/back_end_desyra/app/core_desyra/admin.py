from django.contrib import admin
from .models import Products, Users, Brand, Img_prod, Shipping_address, Shipping, Order, OrderItem

# Register your models here.
admin.site.register(Products)
admin.site.register(Users)
admin.site.register(Brand)
admin.site.register(Img_prod)
admin.site.register(Shipping)
admin.site.register(Shipping_address)
admin.site.register(Order)
admin.site.register(OrderItem)




