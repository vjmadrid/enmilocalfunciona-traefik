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

* Se establece la imagen de Traefiki con una versióne establecida: **traefik:v3.3.3**
* Se define el nombre del contenedor como: **traefik**
* Se define la política de restart
* Se define la red en la que se ubicará
  * En este caso se trata de una red privada
* Se define la opción "security_opt: no-new-privileges" para impedir escaladas de privilegios con setuid
* Establecemos alguna variable de entorno que ayudará a la configuración
  * En este caso se defin el "time zone" que es un aspecto importante para la monitorización y el logging
* Establecemos en la sección "command" la siguiente configuración estática
  * --log.level=info : Nivel de logs utilizados
  * --log.filePath=/logs/traefik.log : Ubicación del fichero de logs físico utilizado
  * --api.insecure=true
  * --providers.docker : Se indica que el provider utilizado sera el de Docker
    * Si no se establece el parámetro "exposedByDefault" este se considera con valor "true" por lo que todos los contenedores en Docker se hacen visibles para Traefik
    * Se aconseja que su valor sea "false", de esta forma se tendrá que indicar de forma particular que contenedores queremos que vea Traefik
* Se definen los puertos:
  * 80 para las peticiones HTTP
  * 8080 para acceder a la Web UI de Traefik
* Se definen los volúmenes del contenedor:
  * Se mapea /etc/localtime para que el contenedor sincronice la hora con el host
  * Se mapea el socket de Docker
    * Requerido por el uso del provider de Docker
    * Define un bind mount para que el socket de comunicación con Docker esté disponible para el contenedor
    * Permite que Traefik pueda conectar el provider docker al API de Docker en la máquina host


>**Importante**
>
>La opción api.insecure NO debe utilizarse en producción



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

Explicación

En este ejemplo hemos utilizados dominios locales para identificar a los diferentes elementos.
Por lo que todos ellos estan en nuestro ordenador (localhost)

Para poder diferenciar a cual nos estamos refiriendo le incorporamos la cabecera, de esta forma se indicará a cual de los dominios estamos haciendo referencia

Cuando se lanza esta petición curl Traefik la recibe por el puerto 80, comprueba que hay un router que encaja con esa cabecera ("backend1.localhost") y en base a esa regla le redirige la petición al contenedor de servicio "backend1"

Este router se configuró automáticamente gracias a la etiqueta traefik.http.routers.whoami.rule=Host('whoami.docker.localhost') que asociamos al contenedor whoami en el fichero docker-compose.yml. Estas etiquetas son procesadas a través del provider Docker para reconfigurar Traefik en tiempo real

1. Verficar que se muestra información sobre la aplicación





## Pruebas

N/A





## Versionado

**Nota :** [SemVer](http://semver.org/) es usado para el versionado.





## Autores

* **Víctor Madrid**
