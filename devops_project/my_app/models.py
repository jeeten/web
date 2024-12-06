from django.db import models
from django.contrib.auth.models import User
# Create your models here.

class My_app(models.Model):
    app = models.CharField(max_length=100)
    timestamp = models.DateTimeField(auto_now_add=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE,blank = True, null = True)

    def __str__(self):
        return self.app
