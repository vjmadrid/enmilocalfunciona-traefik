# enmilocalfunciona-traefik




**Índice**

- [enmilocalfunciona-traefik](#enmilocalfunciona-traefik)
  - [Descripción](#descripción)
  - [Estado](#estado)
  - [Stack Tecnológico](#stack-tecnológico)
    - [General](#general)
    - [Dependencias proyectos de arquitectura](#dependencias-proyectos-de-arquitectura)
    - [Dependencias de terceros](#dependencias-de-terceros)
  - [Pre-Requisitos](#pre-requisitos)
  - [Makefile de gestión del proyecto](#makefile-de-gestión-del-proyecto)
    - [Configuración de Makefile de gestión del proyecto](#configuración-de-makefile-de-gestión-del-proyecto)
    - [Uso de Makefile de gestión del proyecto](#uso-de-makefile-de-gestión-del-proyecto)
      - [Comprobar que se encuentra disponible](#comprobar-que-se-encuentra-disponible)
      - [Preparación para su uso](#preparación-para-su-uso)
  - [Configuración](#configuración)
    - [Configuración de dominios locales](#configuración-de-dominios-locales)
      - [Creación de los dominios locales](#creación-de-los-dominios-locales)
    - [Crear una contraseña para Traefik](#crear-una-contraseña-para-traefik)
    - [Crear el fichero "acme.json"](#crear-el-fichero-acmejson)
    - [Crear un red puclica en docker](#crear-un-red-puclica-en-docker)
  - [Uso](#uso)
    - [Escalado](#escalado)
    - [Probar](#probar)
  - [Uso](#uso-1)
  - [Autor](#autor)





## Descripción

Este **repositorio** se encarga de servir como una **estructura** de los **recursos utilizados** para los **artículos publicados** en la plataforma **enmilocalfunciona.io** relacionados con el uso de **Spectral** y basado en la serie de artículos **“Primeros pasos con Spectral”**

* [Primeros pasos con Spectral (Parte 1)](https://www.enmilocalfunciona.io/primeros-pasos-con-spectral/): Artículo de introducción a la herramienta Spectral que hace uso de diferentes ejemplos y que explica diferentes enfoques de diseño.
  * Su directorio de trabajo es **"basic/"**





## Estado

Este proyecto se encuentra en construcción





## Stack Tecnológico

### General

* [Docker](https://www.docker.com/) - Tecnología de Contenedores/Containers
* [Docker Hub](https://hub.docker.com/) - Repositorio de Docker Público
* [Traefik](xxx) - Herramienta Reverse Proxy
* cURL instalado


### Dependencias proyectos de arquitectura

N/A


### Dependencias de terceros

N/A





## Pre-Requisitos

* Tener instalado Docker y Docker Compose
* Tener instalado soporte para Makefiles
* Disponer de varios dominios públicos para los ejemplos (Pueden ser configurados localmente)
* Tener disponibles los puertos 80, 8080 y 443
* Tener instalado cURL





## Makefile de gestión del proyecto

Se ha diseñado un component software para la gestión del ciclo de vida de las aplicaciones utilizadas
Este componente se ha diseñado sobre la tecnología Makefile

Se requiere que el ordenador tenga soporte para ejecutar esta tecnología

Se compone de 3 ficheros:

* **docker.mk**: Fichero Makefile parcial para gestionar las operaciones y acciones relacionadas con Docker y Docker Compose
* **traefik.mk**: Fichero Makefile parcial para gestionar las operaciones y acciones relacionadas con Traefik
* **Makefile**: Fichero Makefile global genera que gestiona el resto de ficheros

Además hace uso del fichero de variables de entorno **.env**

### Configuración de Makefile de gestión del proyecto

La configuración de este componente se divide en 2 partes:

* **.env**: Fichero de variables de entorno que se incorpora a la ejecución del Makefile
* **Configuración específica**: Cada Fichero Makefile dispone de una sección con la configuración particular

### Uso de Makefile de gestión del proyecto

#### Comprobar que se encuentra disponible

Pasos a seguir:

1. Localizar el directorio principal del proyecto : <PROJECT_PATH>

2. Ejecutar el siguiente comando

```bash
make help
```

3. Verificar que se muestran las operaciones o actividades permitidas


#### Preparación para su uso

El fichero **.env** contiene una varible de entorno que establece el fichero Docker Compose sobre el que trabajar

Se aconseja cambiar en cada uso de un nuevo fichero

```bash
### --- DOCKER ---
...
DOCKER_COMPOSE_FILE_USED=./example/EXAMPLE-docker-compose-01.yml
...
```





## Configuración

Estos son algunos de los aspectos de configuración general para los ejemplos que utilizaremos con Traefik

* Configuración de dominios locales
* Crear una contraseña para Traefik



### Configuración de dominios locales

Normalmente se haría uso de DNS públicos pero como se van a utilizar dominios locales entonces es necesario apuntar a la dirección de loopback (127.0.0.1)

Se usarán 3 dominios locales para exponer los endpoints utilizados en los ejemplos

**Para Traefik**

Traefik tiene un UI Web de panel de control (dashboard) que puede ser expuesta a Internet a través de HTTP

Para Traefik se utilizará: **proxy.localhost**

**Para las aplicaciones a monitorizar**

Estas aplicaciones tendran un endpoint independiente y se encontrarán alojados detrás del proxy inverso

Para Backend1 se utilizará: **backend1.localhost**
Para Backend2 se utilizará: **backend2.localhost**

#### Creación de los dominios locales

**Para el caso de Mac**

Pasos a seguir:

1. Acceder el fichero **/etc/hosts** en modo administrados

Cada sistema operativo puede tener una forma diferente de actualizar este fichero

2. Añadir las siguientes entradas y guardar el fichero

´´´bash
127.0.0.1 proxy.localhost
127.0.0.1 backend1.localhost
127.0.0.1 backend2.localhost
´´´

3. Limpiar/actualizar la cache DNS

Cada sistema operativo tiene su propia forma de acerse

En mi caso funcionó

´´´
sudo killall -HUP mDNSResponder
´´´

4. Ejecutar el comando de ping para cada una de las entradas

5. Verificar que el comando ping responde para cada una de las entradas




### Crear una contraseña para Traefik

Crear un hash para realizar login en el panel web de Traefik

Se puede utilizar la librería: apache2-utils


```bash
    htpasswd -nb test passwordtest
```

### Crear el fichero "acme.json"

touch acme.json

chmod 600 acme.json


### Crear un red puclica en docker

```bash
    docker network create traefik_public
```


## Uso

### Escalado

```bash
docker-compose up --scale backend1=3 -d
```

### Probar

curl localhost:8080/api/rawdata

curl localhost:8080/api/rawdata | jq

curl -s localhost | grep Hostname | awk '{print $2}'






## Uso

Cada una de las partes que componen los artículos dispondrán de un fichero README explicativo





## Autor

* **Víctor Madrid**