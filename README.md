# enmilocalfunciona-traefik


## Configuración

#### Configuración del dominio

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