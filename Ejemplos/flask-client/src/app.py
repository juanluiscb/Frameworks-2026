import requests
from flask import Flask, render_template,request,redirect, url_for

app = Flask(__name__)

@app.route('/')
def home():
    # URL de la API a consumir (ejemplo)
    # api_url = "https://jsonplaceholder.typicode.com/posts"
    api_url = "http://localhost:8001/alumnos/"
    
    # Realizar la petición GET a la API
    response = requests.get(api_url)
    
    # Verificar si la petición fue exitosa
    if response.status_code == 200:
        data = response.json()  # Convertir respuesta a JSON
    else:
        data = []  # O manejar el error
        
    # print(data)
    # Renderizar la plantilla HTML pasando los datos
    return render_template('index.html', posts=data)
    
@app.route('/detalle-alumno/<string:pk>')
def detalle_alumno(pk):
        # URL de la API a consumir (ejemplo)
    print(f'Matricula recolectada: {pk}')
    # api_url = "https://jsonplaceholder.typicode.com/posts"
    api_url = f"http://localhost:8001/alumnos/{pk}/"
    
    # Realizar la petición GET a la API
    response = requests.get(api_url)
    
    # Verificar si la petición fue exitosa
    if response.status_code == 200:
        data = response.json()  # Convertir respuesta a JSON
    else:
        data = []  # O manejar el error
        
    # print(data)
    # Renderizar la plantilla HTML pasando los datos
    return render_template('detalle_alumno.html', posts=data)

@app.route('/add-alumno')
def agregar_alumno():
    if request.method == "GET":
        return render_template('nuevo_alumno.html')

@app.route('/guarda-alumno', methods=['POST'])
def guarda_alumno():
    if request.method == 'POST':
        api_url = f"http://localhost:8001/alumnos/"
        print(f'Valor del campo activo: {request.form.get('activo')}')
        payload={
            'matricula': request.form.get('matricula'),
            'nombre': request.form.get('nombre'),
            'apaterno': request.form.get('apaterno'),
            'amaterno': request.form.get('amaterno'),
            'edad': request.form.get('edad'),
            'email': request.form.get('email'),
            'genero': request.form.get('genero'),
            'activo': request.form.get('activo') if  request.form.get('activo') != None else False
        }
        # print(payload)
        response = requests.post(api_url, json=payload)

        print(f'Estatus:{response.json()}')
        #TODO: Evaluar el resultado
        return redirect(url_for('home'))
    else:
        return f'Error'
    
@app.route('/borrar-alumno/<string:pk>')
def borrar_alumno(pk):
        # URL de la API a consumir (ejemplo)
    # print(f'Matricula recolectada: {pk}')
    # api_url = "https://jsonplaceholder.typicode.com/posts"
    api_url = f"http://localhost:8001/alumnos/{pk}/"
    
    # Realizar la petición GET a la API
    response = requests.delete(api_url)
    
    # Verificar si la petición fue exitosa
    if response.status_code == 200:
        data = response.json()  # Convertir respuesta a JSON
    else:
        data = []  # O manejar el error
    print(response)
    return redirect(url_for('home'))


@app.route('/gql/')
def gql_lista_alumnos():
    api_url = 'http://localhost:8000/graphql'
    query='''
        query GetAlumnos{
            alumnos{
                matricula
                email
                nombre
                apaterno
                amaterno
                activo
            }
        }
    '''
    response = requests.get(api_url,json={'query':query})
    # print(response.json()['data']['alumnos'])
    
    # Verificar si la petición fue exitosa
    if response.status_code == 200:
        data = response.json()['data']['alumnos']  # Convertir respuesta a JSON
    else:
        data = []  # O manejar el error
        
    # Renderizar la plantilla HTML pasando los datos
    return render_template('index.html', posts=data)

@app.route('/gql/detalle-alumno/<string:pk>')
def gql_detalle_alumno(pk):
        # URL de la API a consumir (ejemplo)
    print(f'Matricula recolectada: {pk}')
    # api_url = "https://jsonplaceholder.typicode.com/posts"
    api_url = 'http://localhost:8000/graphql'
    query=f'''
        query {{
            alumnoByMatricula(matricula: "{pk}"){{
                matricula
                nombre
                apaterno
                email
                edad
                genero
            }}
        }}
    '''
    response = requests.get(api_url,json={'query':query})
    
    # Verificar si la petición fue exitosa
    if response.status_code == 200:
        data = response.json()['data']['alumnoByMatricula']  # Convertir respuesta a JSON
    else:
        data = []  # O manejar el error
        
    # Renderizar la plantilla HTML pasando los datos
    return render_template('detalle_alumno.html', posts=data)
    # return response.json()

@app.route('/gql/add-alumno')
def gql_agregar_alumno():
    if request.method == "GET":
        return render_template('nuevo_alumno.html')

@app.route('/gql/guarda-alumno', methods=['POST'])
def gql_guarda_alumno():
    if request.method == 'POST':
        api_url = 'http://localhost:8000/graphql'
        activo = True if  request.form.get('activo') != None else False
        mutation = f"""
           mutation CreaAlumno($matricula: String!,$nombre:String!,$apaterno: String,$amaterno: String,$email: String,$genero: String,$activo: Boolean,$edad:Int){{
            creaAlumno(matricula:$matricula,nombre:$nombre,apaterno:$apaterno,amaterno:$amaterno,email:$email,genero:$genero,activo:$activo,edad:$edad){{
                    alumno{{
                        matricula
                    }}
                }}
            }}
        """

        variables={
            'matricula': request.form.get('matricula'),
            'nombre': request.form.get('nombre'),
            'apaterno': request.form.get('apaterno'),
            'amaterno': request.form.get('amaterno'),
            'edad': int(request.form.get('edad')),
            'email': request.form.get('email'),
            'genero': request.form.get('genero'),
            'activo': activo
        }
        # print(mutation)
        response = requests.post(api_url, json={'query':mutation, 'variables': variables})

        print(f'Estatus:{response.json()}')
        
        return redirect(url_for('gql_lista_alumnos'))
    else:
        return f'Error'
    
@app.route('/gql/borrar-alumno/<string:pk>')
def gql_borrar_alumno(pk):
    api_url = 'http://localhost:8000/graphql'

    mutation = """
        mutation DeleteAlumno($matricula: String!){
            deleteAlumno(matricula: $matricula){
                success
            }
        }
    """

    variables = {'matricula': pk}
    query = {
        'query': mutation,
        'variables': variables
    }
    print(query)
    # Realizar la petición GET a la API
    response = requests.post(api_url,json=query)

    print(response)
    return redirect(url_for('gql_lista_alumnos'))

if __name__ == '__main__':
    app.run(debug=True)
