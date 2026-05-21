# API de Gestión para Fraccionamiento Privado (Django + MariaDB)

La API ha sido desarrollada siguiendo los más altos estándares de calidad backend. A continuación, los detalles para su operación:

## 🚀 Tecnologías Utilizadas
*   **Django 5.x & DRF:** Corazón de la API.
*   **MariaDB:** Motor de base de datos relacional.
*   **Docker & Docker Compose:** Contenerización completa.
*   **PyOTP:** Generación de Códigos QR Dinámicos (TOTP).
*   **Simple JWT:** Autenticación segura basada en tokens.

## 🔑 Credenciales de Prueba (Administrador)
*   **Usuario:** `prueba`
*   **Contraseña:** `temporal2026`

## 📡 Endpoints Principales

### Autenticación
*   `POST /api/token/`: Obtener el Access Token y Refresh Token.
*   `POST /api/token/refresh/`: Refrescar el Access Token.

### Residencial
*   `GET/POST /api/casas/`: Gestión de manzanas, lotes y calles.
*   `GET/POST /api/residentes/`: Registro de residentes y asignación a casas.
*   `GET/POST /api/pagos/`: Control de cuotas de mantenimiento.

### Accesos (Seguridad)
*   `GET/POST /api/invitados/`: Generación de invitaciones. 
    *   *Nota:* Cada invitado tiene un `qr_uri` que se utiliza para generar el código QR dinámico en el frontend.
*   `POST /api/accesos/validar_qr/`: Endpoint utilizado por la caseta.
    *   **Payload:** `{"invitado_id": ID, "token": "123456"}`
    *   El `token` es el código de 6 dígitos que cambia cada 30 segundos en el QR.

## 🛠️ Comandos Útiles
*   **Levantar el sistema:** `docker compose up -d`
*   **Ver logs:** `docker compose logs -f web`
*   **Crear migraciones:** `docker compose exec web python manage.py makemigrations`
*   **Aplicar migraciones:** `docker compose exec web python manage.py migrate`

### Seguridad y Políticas de Contraseñas
Se han implementado las políticas de seguridad de Django para garantizar que las contraseñas de los usuarios nunca se almacenen en texto plano:
1.  **Hashing:** Todas las contraseñas se almacenan utilizando el algoritmo PBKDF2 con SHA256 por defecto.
2.  **Validación:** Se han activado los validadores de Django (`AUTH_PASSWORD_VALIDATORS`) para asegurar contraseñas robustas.
3.  **Administración:** El modelo de usuario utiliza `UserAdmin`, asegurando que las creaciones y ediciones desde el panel administrativo sigan los protocolos de seguridad.
4.  **Seguridad TOTP:** La implementación de TOTP garantiza que las capturas de pantalla de los QR de invitados expiren rápidamente, manteniendo el fraccionamiento seguro.

¡Mucho éxito con su proyecto!

