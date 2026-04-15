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
        payload={
            'matricula': request.form.get('matricula'),
            'nombre': request.form.get('nombre'),
            'apaterno': request.form.get('apaterno'),
            'amaterno': request.form.get('amaterno'),
            'edad': request.form.get('edad'),
            'email': request.form.get('email'),
            'genero': request.form.get('genero'),
            'activo': request.form.get('activo')
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


if __name__ == '__main__':
    app.run(debug=True)
