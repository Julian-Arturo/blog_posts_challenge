# 📚 Blog Posts Challenge

**Blog Posts Challenge**  es una aplicación multiplataforma en Flutter que permite a los usuarios ver publicaciones del blog en dispositivos móviles y web. La aplicación sigue la Clean Architecture con Cubit para la gestión de estado, organizada en capas de datos, dominio y presentación, y utiliza inyección de dependencias para mejorar la modularidad y escalabilidad. Esta arquitectura fue elegida por su simplicidad y eficiencia, adecuada para el alcance limitado del proyecto, permitiendo un flujo de datos y lógica de negocio claro y fácil de mantener.

---

## 📑 Tabla de Contenidos
- [Descripción del Proyecto](#-descripción-del-proyecto)
- [Arquitectura](#-arquitectura)
- [Características](#-características)
- [Dependencias](#-dependencias)
- [Estrategia de Pruebas](#-estrategia-de-pruebas)
- [Configuración Inicial](#-configuración-inicial)
- [Comandos para Ejecutar la Aplicación](#-comandos-para-ejecutar-la-aplicación)

---

## 📝 Descripción del Proyecto

**Blog Posts Challenge** permite a los usuarios ver publicaciones en el blog mediante una interfaz elegante y responsiva, diseñada para funcionar perfectamente tanto en dispositivos móviles como en navegadores web. Este proyecto prioriza la testabilidad, utilizando Cubit para la separación de la lógica de negocio y `get_it` para la inyección de dependencias. Su diseño modular permite una escalabilidad y mantenibilidad excepcionales.

---

## 🏗️ Arquitectura

El proyecto sigue el patrón de **Arquitectura Limpia (Clean Architecture)**, garantizando una clara separación de responsabilidades entre sus componentes:

- **Cubit**: Administra el estado y la lógica de negocio, permitiendo que los componentes de UI se enfoquen exclusivamente en la presentación.
- **Inyección de Dependencias**: Utiliza `get_it` e `injectable` para gestionar dependencias, facilitando el reemplazo de componentes (e.g., para pruebas o implementaciones alternativas).
- **Capa de Datos**: Responsable de la obtención de datos mediante APIs, usando el paquete  `http` para realizar peticiones HTTP.
- **Capa de Presentación**: Contiene la interfaz de usuario y Cubit, construida con widgets de Flutter y animaciones para una experiencia de usuario agradable.

### 🗂️ Estructura del Proyecto

El proyecto está organizado en las siguientes carpetas principales:
 
- `core`: Contiene elementos reutilizables y comunes de la aplicación, como dependencias o configuraciones generales.
- `feature`: Cada funcionalidad de la app (en este caso, blog) tiene su propia carpeta y está organizada en subcapas:
   - `data`: Para la implementación de fuentes de datos (API, base de datos, etc.).
   - `domain`: Para definir la lógica de negocio y las entidades de la aplicación.
   - `presentation`: Para la capa de presentación de cada funcionalidad.
       - `bloc`: Aquí se gestionan los Cubits o BLoCs relacionados con el estado.
       - `widgets`: Componentes específicos de la UI.
       - `screens`:  Es donde se define la interfaz de usuario (UI).
- `injection`: Configuración de la inyección de dependencias para hacer el código modular.
- `app.dart, main.dart, routes.dart`: Archivos principales para iniciar la aplicación, definir las rutas, y organizar la navegación.

---


## ✨ Características

- **Compatibilidad multiplataforma**: Funciona en dispositivos móviles y navegadores web.
- **Animaciones responsivas**: Uso de animaciones Lottie para crear una experiencia de carga visualmente atractiva solo para mobile.
- **Inyección de dependencias**: Arquitectura modular utilizando `get_it` e `injectable`.
- **Gestión de estado con Cubit**: Simplifica la gestión de estados y mejora la testabilidad del código.

---

## 📦 Dependencias

Este proyecto utiliza varias librerías clave:

- `flutter_bloc`: Para gestión de estado mediante el patrón BLoC.
- `go_router`: Enrutamiento declarativo.
- `get_it` y `injectable`: Para inyección de dependencias.
- `http`: Cliente HTTP.
- `lottie`: Soporte para animaciones.
- `freezed` y `json_serializable`: Clases de datos inmutables y serialización JSON.
- `mockito` y `mocktail`: Para mocking en pruebas unitarias.
- `bloc_test`: Pruebas de estados en BLoC.

Para la lista completa de dependencias, revisa el archivo `pubspec.yaml`.

---

## 🧪 Estrategia de Pruebas

Este proyecto aplica una combinación de pruebas **White-box (caja blanca)**, **Black-box (caja negra)** y **Gray-box (caja gris)**:

- **Pruebas Unitarias**: Para componentes individuales y lógica de negocio, utilizando `test` y `bloc_test`.
- **Pruebas de Widgets**: Para verificar componentes UI en forma aislada.
- **Pruebas de Integración**: Enfocadas en validar la funcionalidad completa y el flujo de características.
- **Mocking e Inyección de Dependencias**: Uso de `mockito` y `mocktail` para pruebas unitarias.

---

## 🛠️ Configuración Inicial

Para configurar el proyecto **Blog Posts Challenge** localmente, sigue estos pasos:

### Requisitos Previos
Asegúrate de tener Flutter instalado y configurado. Puedes seguir la [guía de instalación de Flutter](https://flutter.dev/docs/get-started/install) si necesitas ayuda.

### Instalación

1. **Clona el Repositorio**:

    ```
    https://github.com/Julian-Arturo/blog_posts_challenge.git
    cd blog_posts_challenge
    ```

2. **Instala Dependencias**:

    ```
    flutter pub get
    ```

3. **Genera Código** (para `injectable` y `freezed`):

    ```
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

4. **Ejecuta Pruebas**:

    ```
    flutter test
    ```

---

## 🚀 Comandos para Ejecutar la Aplicación

### Ejecutar en Móvil
Para ejecutar la aplicación en un emulador o dispositivo físico Android o iOS:

    flutter run


Ejecutar en Web
Para ejecutar la aplicación en un navegador web (por ejemplo, Chrome), asegúrate de estar en el directorio del proyecto y utiliza:

    flutter run -d chrome


Para más opciones de personalización, consulta la documentación del CLI de Flutter.

-
-
-