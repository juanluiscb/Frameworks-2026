from django.shortcuts import render,redirect
from rest_framework import viewsets
from rest_framework.response import Response
from rest_framework.permissions import IsAuthenticated
from django.shortcuts import get_object_or_404
from rest_framework import status

from .models import Alumno,Asistencia,AlumnoAsistencia
from .serializers import AlumnoSerilizer

class AlumnoViewSet(viewsets.ModelViewSet):
    queryset = Alumno.objects.all()
    serializer_class = AlumnoSerilizer
    # permission_classes = [IsAuthenticated]

    def list(self, request):
        queryset = Alumno.objects.all()
        serializer = AlumnoSerilizer(queryset, many=True)
        return Response(serializer.data)

    def create(self, request, *args,**kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        headers = self.get_success_headers(serializer.data)
        return Response(serializer.data, status=status.HTTP_201_CREATED, headers=headers)
        

    def retrieve(self,request, pk=None):
        queryset = Alumno.objects.all()
        alumno = get_object_or_404(queryset, matricula=pk)
        serializer = AlumnoSerilizer(alumno)
        return Response(serializer.data)
    
    # def update(self, request, pk=None):
    #     pass

    # def partial_update(self, request, pk=None):
    #     pass

    def destroy(self, request, pk=None):
        queryset = Alumno.objects.all()
        alumno = get_object_or_404(queryset, matricula=pk)
        alumno.delete()
        return Response("Ok")