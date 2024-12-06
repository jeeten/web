from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
# from rest_framework import viewsets
from rest_framework import permissions

from .models import My_app
from .serializers import My_appSerializer

class My_appView(APIView):
    permission_classes = [permissions.IsAuthenticated]
    def get(self, request, *args, **kwargs):
        # qs = My_app.objects.all()
        qs = My_app.objects.filter(user = request.user.id)
        serializer = My_appSerializer(qs, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request, *args, **kwargs):

        data = {
            'app': request.data.get('app'),
            'user': request.user.id
        }
        serializer = My_appSerializer(data=data)
        if serializer.is_valid():
            serializer.save()
            # serializer.save(user=request.user)
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    

class GetAccessTokenView(APIView):
    permission_classes = [permissions.IsAuthenticated]  # Only allow authenticated users to request tokens

    def post(self, request, *args, **kwargs):
        user = request.user
        token, created = Token.objects.get_or_create(user=user)
        return Response({'access_token': token.key})    



# Create your views here.


