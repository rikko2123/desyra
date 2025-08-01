# Generated by Django 5.2.3 on 2025-06-30 08:15

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Brand',
            fields=[
                ('id_brand', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=50)),
                ('description', models.TextField(max_length=5000)),
                ('logo_path', models.ImageField(upload_to='')),
                ('web_site', models.URLField(max_length=100)),
                ('is_active', models.BooleanField(default=True)),
            ],
        ),
        migrations.CreateModel(
            name='Chart',
            fields=[
                ('id_chart', models.AutoField(primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Shipping',
            fields=[
                ('id_shipping', models.AutoField(primary_key=True, serialize=False)),
                ('tracking_code', models.CharField(max_length=30)),
                ('courier', models.CharField(max_length=50)),
                ('status', models.CharField(choices=[('pending', 'In attesa'), ('shipped', 'Spedito'), ('in_transit', 'In transito'), ('delivered', 'Consegnato'), ('cancelled', 'Cancellato')], default=('pending', 'In attesa'), max_length=50)),
                ('shipping_at', models.DateField()),
                ('delivered_at', models.DateField()),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Shipping_address',
            fields=[
                ('id_address', models.AutoField(primary_key=True, serialize=False)),
                ('street_address', models.CharField(max_length=500)),
                ('city', models.CharField(default='Roma', max_length=20)),
                ('postal_code', models.CharField(max_length=5)),
                ('province', models.CharField(max_length=2)),
                ('country', models.CharField(max_length=20)),
                ('is_default', models.BooleanField(default=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Wishlist',
            fields=[
                ('id_wishlist', models.AutoField(primary_key=True, serialize=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
        ),
        migrations.CreateModel(
            name='Users',
            fields=[
                ('id_user', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.TextField(max_length=50)),
                ('surname', models.TextField(max_length=50)),
                ('email', models.EmailField(max_length=254)),
                ('password', models.CharField(max_length=128)),
                ('role', models.CharField(choices=[('admin', 'amministratore'), ('costumer', 'cliente')], default=('costumer', 'cliente'), max_length=50)),
                ('date_joined', models.DateTimeField(auto_now_add=True)),
                ('username', models.CharField(max_length=50)),
                ('phone', models.CharField(max_length=20)),
                ('birth_date', models.DateField()),
                ('gender', models.CharField(choices=[('male', 'maschio'), ('female', 'femmina')], max_length=50)),
                ('news_letter', models.BooleanField(default=False)),
                ('is_active', models.BooleanField(default=True)),
                ('sing_up_ip', models.GenericIPAddressField()),
                ('updated_at', models.DateTimeField(auto_now=True)),
                ('chart', models.OneToOneField(db_column='id_chart', on_delete=django.db.models.deletion.CASCADE, to='core_desyra.chart')),
                ('shipping_address', models.ForeignKey(db_column='id_address', on_delete=django.db.models.deletion.CASCADE, to='core_desyra.shipping_address')),
                ('wishlist', models.OneToOneField(db_column='id_wishlist', on_delete=django.db.models.deletion.CASCADE, to='core_desyra.wishlist')),
            ],
        ),
    ]
