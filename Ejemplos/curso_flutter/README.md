# Curso de Flutter para Principiantes 🚀

¡Bienvenido al curso de Flutter! Este curso está diseñado para llevarte desde cero hasta la creación de tus primeras aplicaciones móviles multiplataforma.

## 📋 Guía Paso a Paso para Probar el Código

Para que el aprendizaje sea fluido, seguiremos una metodología de "Proyecto Base". En lugar de crear un proyecto de Flutter para cada lección (lo cual ocuparía mucho espacio en disco), crearemos un solo proyecto y cambiaremos el archivo principal.

### 1. Prerrequisitos
Antes de empezar, asegúrate de tener instalado:
- **Flutter SDK:** [Guía oficial de instalación](https://docs.flutter.dev/get-started/install).
- **Editor de Código:** VS Code (recomendado) con las extensiones de "Flutter" y "Dart".
- **Emulador o Dispositivo Real:** Un emulador de Android/iOS o tu propio teléfono conectado.

### 2. Crear el Proyecto de Práctica
Abre una terminal y ejecuta:
```bash
flutter create mi_practica_flutter
cd mi_practica_flutter
```

### 3. Cómo Probar cada Lección
Cada carpeta de este curso (ej. `01_hola_mundo`) contiene un archivo `main.dart`. Para probar una lección:

1.  Abre tu carpeta `mi_practica_flutter` en VS Code.
2.  Busca el archivo `lib/main.dart` (es el punto de entrada de la app).
3.  **Borra todo el contenido** de ese archivo.
4.  **Copia y pega** el contenido del `main.dart` de la lección que quieres estudiar (ej. el de `curso_flutter/01_hola_mundo/main.dart`).
5.  Guarda el archivo y ejecuta la aplicación presionando `F5` o ejecutando `flutter run` en la terminal.

---

## 📚 Temario del Curso

1.  **01_hola_mundo:** Estructura básica y el widget `MaterialApp`.
2.  **02_widgets_basicos:** Uso de `Text`, `Icon`, `Image` y `Container`.
3.  **03_layouts:** Cómo organizar elementos con `Row`, `Column` y `Stack`.
4.  **04_estado_interactividad:** Diferencia entre `Stateless` y `Stateful` widgets.
5.  **05_navegacion:** Cómo pasar de una pantalla a otra.
6.  **06_listas:** Creación de listas dinámicas con `ListView.builder`.
7.  **07_formularios:** Captura de datos del usuario y validación.
8.  **08_peticiones_http:** Consumir datos de una API de internet.
9.  **09_manejo_estado:** Introducción básica a `Provider` para compartir datos.
10. **10_proyecto_final:** Creación de una aplicación de Lista de Tareas (To-Do List).

---

## 🛠️ Consejos Útiles
- **Hot Reload (R):** Flutter permite ver los cambios casi instantáneamente al guardar el archivo.
- **Widget Tree:** En Flutter, todo es un widget. Visualiza tu app como un árbol de componentes.
- **Documentación:** Si tienes dudas sobre un widget, la [documentación oficial](https://docs.flutter.dev/) es excelente.

¡Disfruta el camino de aprendizaje! 💡
