from rest_framework import serializers
from .models import My_app

class My_appSerializer(serializers.ModelSerializer):
    class Meta:
        model = My_app
        # fields = '__all__'
        fields = ["app", "timestamp", "user"]
