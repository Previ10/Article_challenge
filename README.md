# articles_app_challenge

A new Flutter project.

1 - Servicios (Services):
Estos son responsables de manejar la comunicación HTTP y las preferencias compartidas (local storage).

2 - Fuentes de Datos (Data Sources):
Aquí es donde se realiza la obtención de datos remotos (API).

3 - Repositorios (Repositories):
Los repositorios actúan como una capa intermedia entre las fuentes de datos y los casos de uso, proporcionando una abstracción para obtener los datos.

4 - Casos de Uso (Use Cases):
Los casos de uso encapsulan una funcionalidad de negocio y actúan como una capa de aplicación.

5 - Gestión del Estado con Bloc:
Bloc gestiona el estado de la UI y maneja la lógica de negocio.

6 - Inyección de Dependencias con GetIt:
GetIt facilita la inyección de dependencias, asegurando que cada parte del código reciba sus dependencias necesarias.


#URL:

1 - https://newsapi.org/v2/top-headlines?country=us&apiKey=8a108894c11b45bb91a2591b542dfb7a
2 - https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=8a108894c11b45bb91a2591b542dfb7a