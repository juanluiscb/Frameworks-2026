import graphene
from api.Query import Query
from api.Mutations import Mutation
schema = graphene.Schema(query=Query,mutation=Mutation)