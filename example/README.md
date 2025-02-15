# Ejemplo de Traefik

Este proyecto representa una estructura de recursos utilizados para el uso de **Traefik** con **Docker**

* **docker-compose.yaml:** representa una instalación independiente, básica, y customizada (a nivel de propiedades) de **Traefik** con **Docker**

Incluye el uso de Base de datos **Whoami** (para conseguir persistencia)





## Stack Tecnológico

* [Docker](https://www.docker.com/) - Tecnología de Contenedores/Containers
* [Docker Hub](https://hub.docker.com/) - Repositorio de Docker Público
* [Traefik](xxx) - xxx

Dependencias con Proyectos de Arquitectura

N/A

Dependencias con Terceros

N/A





## Prerrequisitos

Define que elementos son necesarios para instalar el software

* Docker instalado (19+)





## Instalación

### Docker Compose

Configuración del fichero "docker-compose.yaml"

```bash

```

En este fichero se establece el constructor de la imagen que se utilizará, se definirán una serie de volúmenes y se publicará por el puerto específico de la aplicación

Configuración del fichero "Dockerfile"

```bash

```

En este fichero se establece la versión a utilizar de sonarqube, contiene una serie de instrucciones que pueden facilitar la preparación de la imagen y el despliegue inicial, incorpora el cambio de las propieaddes de la aplicación

Pasos a seguir


1. Localizar el directorio principal del proyecto : <PROJECT_PATH> (/example)

2. Ejecutar el siguiente comando

```bash
docker-compose up --build

ó

docker-compose up --build -d
```

3. Comprobar que la imagen ha sido creada

Verificar que parece como imagen Docker el nombre "xxx"





### Docker Standalone

N/A





## Uso


### Uso de Traefik

**Probar acceso al Web UI**

Cargar la URL :

```bash
http://localhost:8080/
```

**Probar acceso al API**

Ejecutar el siguiente comando :

```bash
 http://localhost:8080/api/rawdata
```

### Uso de Whoa.i

Cargar la URL :

```bash
http://backend1.localhost
```

**Probar disponibilidad**

Ejecutar el siguiente comando :

```bash
curl -H Host:backend1.localhost http://127.0.0.1
```





## Pruebas

N/A





## Versionado

**Nota :** [SemVer](http://semver.org/) es usado para el versionado.





## Autores

* **Víctor Madrid**
