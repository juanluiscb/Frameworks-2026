# 📱 Guía de Integración para Frontend (Flutter) - Proyecto Caseta

Esta guía contiene las especificaciones técnicas para integrar la App móvil con la API **Caseta**. La API está construida en Django REST Framework y utiliza MariaDB como base de datos.

## 🛠 Especificaciones Generales
*   **Base URL:** `http://<ip-del-servidor>:8000/api/`
*   **Formato de Datos:** JSON
*   **Autenticación:** JWT (JSON Web Tokens)

---

## 🔐 Autenticación (Simple JWT)

Para todas las peticiones (excepto Login), se debe incluir el header:
`Authorization: Bearer <access_token>`

### 1. Iniciar Sesión
**POST** `/token/`
*   **Payload:** `{"username": "prueba", "password": "temporal2026"}`
*   **Respuesta:**
    ```json
    {
        "refresh": "eyJhbG...",
        "access": "eyJhbG..."
    }
    ```

### 2. Refrescar Token
**POST** `/token/refresh/`
*   **Payload:** `{"refresh": "token_de_refresh"}`

---

## 🏘 Módulo Residencial

### Listar Casas
**GET** `/casas/`

### Perfil del Residente
**GET** `/residentes/`
*   Retorna la información del residente logueado, incluyendo su casa asociada.

---

## 🎫 Módulo de Accesos (Invitaciones y QR)

Este es el núcleo de la aplicación. Para Flutter, recomendamos usar el paquete [**base32**](https://pub.dev/packages/base32) y [**otp**](https://pub.dev/packages/otp) o [**qr_flutter**](https://pub.dev/packages/qr_flutter).

### 1. Crear Invitación
**POST** `/invitados/`
*   **Payload:**
    ```json
    {
        "residente": 1,
        "nombre_completo": "Juan Pérez",
        "fecha_visita": "2026-05-15"
    }
    ```

### 2. Obtener Lista de Invitados y Secreto QR
**GET** `/invitados/`
*   **Respuesta:**
    ```json
    [
        {
            "id": 1,
            "nombre_completo": "Juan Pérez",
            "fecha_visita": "2026-05-15",
            "es_valida": true,
            "qr_uri": "otpauth://totp/Juan%20Pérez?secret=JBSWY3DPEHPK3PXP&issuer=Caseta%20-%20Acceso%20Seguro"
        }
    ]
    ```

### 💡 Lógica del QR Dinámico en Flutter
Para implementar la seguridad TOTP (Time-based One-Time Password):
1.  **Extraer el Secreto:** Del campo `qr_uri`, obtén el parámetro `secret` (ej: `JBSWY3DPEHPK3PXP`).
2.  **Generar Código:** Usa una librería de OTP en Flutter para generar el código de 6 dígitos basado en ese secreto y el tiempo actual (intervalo de 30 segundos).
3.  **Mostrar QR:** El código QR mostrado al guardia debe contener un JSON o String que incluya:
    *   `ID de la invitación`
    *   `Token de 6 dígitos actual`
    *   Ejemplo de contenido del QR: `CAS-1-123456` (Sistema-ID-Token)

---

## 🛡 Validación en Caseta (Para App del Guardia)

**POST** `/accesos/validar_qr/`
*   **Payload:**
    ```json
    {
        "invitado_id": 1,
        "token": "123456"
    }
    ```
*   **Respuesta Exitosa (200 OK):**
    ```json
    {
        "status": "Acceso Concedido",
        "invitado": "Juan Pérez"
    }
    ```
*   **Error (400 Bad Request):**
    ```json
    {
        "error": "Token inválido o expirado"
    }
    ```

---

## 📁 Manejo de Pagos
**POST** `/pagos/`
*   Se debe enviar como `multipart/form-data` si se incluye la imagen del comprobante.
*   **Campos:** `residente`, `monto`, `mes_correspondiente`, `comprobante` (archivo).

---

**Nota para el Desarrollador:** Si tienes dudas con la sincronización de tiempo entre el dispositivo y el servidor para el TOTP, asegúrate de que ambos utilicen la zona horaria `America/Mexico_City` o UTC.
