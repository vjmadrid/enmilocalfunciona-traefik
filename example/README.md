# Ejemplo de Traefik

Este proyecto representa una estructura de recursos utilizados para el uso de **Traefik** con **Docker**

* **docker-compose.yaml:** representa una instalación independiente, básica, y customizada (a nivel de parámetros) de **Traefik** con **Docker**

Incluye el uso de la aplicación de ejemplo de **whoami**

* Ayudará a probar Traefik
* Aplicación proporcionada por el propio fabricante
* https://hub.docker.com/r/traefik/whoami





## Stack Tecnológico

* [Docker](https://www.docker.com/) - Tecnología de Contenedores/Containers
* [Docker Hub](https://hub.docker.com/) - Repositorio de Docker Público
* [Traefik](https://traefik.io/) - Tecnología de Edge Server

Dependencias con Proyectos de Arquitectura

N/A

Dependencias con Terceros

N/A





## Prerrequisitos

Define que elementos son necesarios para instalar el software

* Docker instalado (19+)
* Dominios públicos creados
  * Se indica en el fichero README.md principal del respositorio
* Soporte a Makefile
* cURL instalado





## Instalación

N/A




### Ejemplo "EXAMPLE-docker-compose-01.yml"

Ejemplo básico de Traefik monitorizando la aplicación de whoami

>Importante: Este ejemplo es el que se proporciona en la web con algun cambio mínimo

#### Configurar el fichero ".env" principal

Pasos a seguir:

1. Localizar el directorio principal del proyecto : <PROJECT_PATH>

2. Localizar el fichero ".env"

3. Modificar la ruta local del fichero Docker Compose utilizado

Se debe indicar el directorio y el nombre del fichero

```bash
DOCKER_COMPOSE_FILE_USED=./example/EXAMPLE-docker-compose-01.yml
```

4. Guardar el fichero


### Configurar el fichero Docker Compose

Configuración del fichero "EXAMPLE-docker-compose-01.yml"

```bash

```

**Explicación para el contenedor "traefik"**

* Basado en la imagen traefik:v3.3.3
* Establecemos alguna variable de entorno que ayudará a la configuración
* Establecemos en la sección "command" configuración estática
  * --api.insecure=true
  * --providers.docker al comando de arranque de la imagen Traefik
* Conectamos los puertos 80 y 8080 del contenedor al exterior (a la red host)
* Definimos un bind mount para que el socket de comunicación con Docker esté disponible para el contenedor
  * Se necesita para que Traefik pueda conectar el provider docker al API de Docker en la máquina host


**Explicación para el contenedor "backend1"**



#### Uso

Pasos a seguir

1. Localizar el directorio principal del proyecto : <PROJECT_PATH>

2. Ejecutar el siguiente comando

```bash
make up
```

3. Verificar que se han levantado los dos contenedores sin problemas


#### Uso de Traefik

**Probar acceso al Web UI**

Pasos a seguir

1. Arrancar un navegador
2. Cargar la URL: **http://localhost:8080/**
3. Verificar que se carga la interfaz Web de Traefik

**Probar acceso al API**

Pasos a seguir:

1. Arrancar un navegador
2. Cargar la URL: **http://localhost:8080/api/rawdata**
3. Verificar que se cargan detalles de configuración de Traefik en base a un JSON



### Uso de Whoami

**Probar el acceso a la aplicación de pruebas desde su interfaz**

Pasos a seguir:

1. Arrancar un navegador
2. Cargar la URL: **http://backend1.localhost**
3. Verificar que se carga una página de detalle de la aplicación



**Probar el acceso a la aplicación de pruebas desde línea de comandos**

Pasos a seguir:

1. Ejecutar el siguiente comando :

```bash
curl -H Host:backend1.localhost http://127.0.0.1
```

2. Verficar que se muestra información sobre la aplicación





## Pruebas

N/A





## Versionado

**Nota :** [SemVer](http://semver.org/) es usado para el versionado.





## Autores

* **Víctor Madrid**
