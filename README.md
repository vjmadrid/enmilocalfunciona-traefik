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
    - [Configuración](#configuración)
  - [Configuración](#configuración-1)
    - [Configuración de dominios locales](#configuración-de-dominios-locales)
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


### Dependencias proyectos de arquitectura

N/A


### Dependencias de terceros

N/A





## Pre-Requisitos

* Requerido tener instalado Docker y Docker Compose
* Requerido tener instalado soporte para Makefiles
* Requeridos disponer de varios dominios públicos para los ejemplos (Pueden ser configurados localmente)
* Requerido tener disponibles los puertos 80, 8080 y 443





## Makefile de gestión del proyecto

Se ha diseñado un component software para la gestión del ciclo de vida de las aplicaciones utilizadas
Este componente se ha diseñado sobre la tecnología Makefile

* Requiere que el ordenador tenga soporte para ejecutar esta tecnología

Se compone de 3 ficheros:

* **docker.mk**: Fichero Makefile parcial para gestionar las operaciones y acciones relacionadas con Docker y Docker Compose
* **traefik.mk**: Fichero Makefile parcial para gestionar las operaciones y acciones relacionadas con Traefik
* **Makefile**: Fichero Makefile genera que gestiona el resto de ficheros

### Configuración

La configuración de este componente se divide en dos partes:

* **.env**: Fichero de variables de entorno que se incorpora a la ejecución del Makefile
* **Configuración específica**: Cada Fichero Makefile dispone de una sección con la configuración particular





## Configuración

## Gestor del proyecto

Se ha diseñado una pieza gestora 

### Configuración de dominios locales

Se usaran 3 dominios locales para exponer los endpoints del ejemplo

**Traefik**

Traefik tiene un UI Web de panel de control (dashboard) que puede ser expuesta a Internet a través de HTTP
Se aconseja su uso pero NO en entornso productivos

La URL se utilizará
Traefik dashboard - https://proxy.localhost

**Backend1 y Backend2**

Estas aplicaciones tendran un endpoint independiente y se encontrarán alojados detrás del proxy inverso

Backend1 - https://backend1.localhost
Backend1 - https://backend2.localhost

Si no se van a utilizar DNS públicos entonces se va a necesitar apuntar a nuestra direccio de loopback (127.0.0.1). De esta forma podrán ser accesibles desde el traefik utilizado en el fichero

Para el caso de Mac

Se necesita actualizar el fichero /etc/hosts en modo administrador
Conviene revisar como se configura este fichero en cada sistema operativo

´´´bash
127.0.0.1 proxy.localhost
127.0.0.1 backend1.localhost
127.0.0.1 backend2.localhost
´´´



If ping yourdomain.com still gives you the wrong IP, try clearing your DNS cache:

OSX 10.4 and below: lookupd -flushcache
OSX 10.5 + 10.6: dscacheutil -flushcache
OSX 10.7 + 10.8: sudo killall -HUP mDNSResponder
OSX 10.9 and above: sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder
OSX 10.12 and above: sudo dscacheutil -flushcache
OSX 10.14.5 and above: dscacheutil -flushcache



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