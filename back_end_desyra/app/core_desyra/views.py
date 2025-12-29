from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.db import connection
# Create your views here.

class HealtCheck(APIView):
    
    def get(self, request):
        return Response(
            {"status": "ok"},
            status=status.HTTP_200_OK
        )