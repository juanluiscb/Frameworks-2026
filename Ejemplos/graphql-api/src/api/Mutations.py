import graphene
from .models import Alumno
from .Types import AlumnoType

class CreaAlumnoMutation(graphene.Mutation):
    class Arguments:
        matricula = graphene.String(required=True)
        nombre = graphene.String(required=True)
        apaterno = graphene.String()
        amaterno = graphene.String()
        genero = graphene.String()
        email = graphene.String()
        edad = graphene.Int()
        activo = graphene.Boolean()

    alumno = graphene.Field(AlumnoType)

    @classmethod
    def mutate(cls, root, info, **al):
        alumno = Alumno(
            matricula = al['matricula'],
            nombre = al['nombre'],
            apaterno = al['apaterno'],
            amaterno = al['amaterno'],
            genero = al['genero'],
            email = al['email'],
            edad = al['edad'],
            activo = al['activo']
        )
        alumno.save()
        return CreaAlumnoMutation(alumno=alumno)
    
class Mutation(graphene.ObjectType):
    crea_alumno = CreaAlumnoMutation.Field()