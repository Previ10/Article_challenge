# Articles App Challenge : Previgliano Julian Ignacio

Repositorio de GitHub: [https://github.com/Previ10/Article_challenge.git](https://github.com/Previ10/Article_challenge.git)

Este es un proyecto de Flutter que muestra artículos de noticias utilizando la API de NewsAPI.org.

## Estructura del Proyecto

1. **Servicios (Services)**:
   - Responsables de manejar la comunicación HTTP y las preferencias compartidas (local storage).

2. **Fuentes de Datos (Data Sources)**:
   - Aquí es donde se realiza la obtención de datos remotos (API).

3. **Repositorios (Repositories)**:
   - Los repositorios actúan como una capa intermedia entre las fuentes de datos y los casos de uso, proporcionando una abstracción para obtener los datos.

4. **Casos de Uso (Use Cases)**:
   - Encapsulan una funcionalidad de negocio y actúan como una capa de aplicación.

5. **Gestión del Estado con Bloc**:
   - Bloc gestiona el estado de la UI y maneja la lógica de negocio.

6. **Inyección de Dependencias con GetIt**:
   - GetIt facilita la inyección de dependencias, asegurando que cada parte del código reciba sus dependencias necesarias.

## URLs de la API

1. [Top Headlines en US](https://newsapi.org/v2/top-headlines?country=us&apiKey=8a108894c11b45bb91a2591b542dfb7a)
2. [Top Headlines de BBC News](https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=8a108894c11b45bb91a2591b542dfb7a)

## Instrucciones para Arrancar el Proyecto en Flutter

### Pre-requisitos

Antes de comenzar, asegúrate de tener lo siguiente instalado en tu máquina:

- **Flutter SDK**: Puedes descargarlo desde [flutter.dev](https://flutter.dev/docs/get-started/install).
- **Android Studio** o **Visual Studio Code** (recomendado para desarrollo con Flutter).
- **Git**: Para clonar repositorios.
- **Dart SDK**: Viene incluido con Flutter SDK.

### Clonar el Repositorio

Primero, clona el repositorio de tu proyecto:

git clone [https://github.com/Previ10/Article_challenge.git]

## Instalar Dependencias: 
flutter pub get

## Correr Proyecto: 
flutter run

## Correr Test: 
flutter test