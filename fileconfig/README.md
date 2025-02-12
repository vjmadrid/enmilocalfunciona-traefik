# enmilocalfunciona-traefik


## Ejemplo "FILE-docker-compose-03.yml"

Ejemplo de uso de traefil en un entorno local

### Configuración de Traefik

* Configuración de red
* Configuración del dominio
* Configuración del certificado local

#### Configuración de red

Para este ejemplo se necesita configurar una red local, para elloa aprovecharemos la red definida dentro del fichero "FILE-docker-compose-03.yml"

```bash
networks:
  localhost_net:
    name: localhost_net
    external: true
```

Pasos a seguir:

* Verificar la existencia de esta sección en fichero
* Ejecutar el siguiente comando

```bash
docker network create localhost_net
```

* Verificar que se ha creado la red



#### Configuración del dominio

Se usaran 3 dominios locales para exponer los endpoints del ejemplo

Traefik dashboard - https://proxy.localhost
Backend1 - https://backend1.localhost
Backend1 - https://backend2.localhost

#### Configuración del Certificado Local

Generate local SSL certificates using OpenSSL at the root of your project:

```bash
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
-keyout localhost.key -out localhost.crt
```

Este comando generará los ficheros: localhost.crt y localhost.key


    chmod 600 config/acme.json
    docker-compose.yaml: change hostname 'test.example.invalid' to your real hostname
    docker-compose.yaml: change basic auth password!! (see comments in file)
    config/traefik.yaml: change email address
    open each file, check it by yourself and understand what it does
    create a docker network named 'traefik-servicenet' (docker network create traefik-demo)
