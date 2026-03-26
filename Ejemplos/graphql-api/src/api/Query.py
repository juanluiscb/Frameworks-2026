import graphene
from .Types import AlumnoType,AsistenciaType,AlumnoAsistenciaType
from .models import Alumno,Asistencia,AlumnoAsistencia

class Query(graphene.ObjectType):
    alumnos = graphene.List(AlumnoType)
    alumnoByMatricula = graphene.Field(AlumnoType,matricula=graphene.String(required=True))

    def resolve_alumnos(root,info):
        return Alumno.objects.all()
    
    def resolve_alumnoByMatricula(root,info,matricula):
        return Alumno.objects.get(matricula=matricula)
