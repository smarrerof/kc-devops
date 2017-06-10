# Nodepop
Práctica de DevOps del V KeepCoding Startup Engineering Master Bootcamp (2017).
Toda la información referente a la API utilizada en est despliegue puede ser consultada en su [repositorio](https://github.com/smarrerof/kc-nodejs).
Esta es la parte opcional de la práctica donde se realizará el mismo despliegue pero utilizado [Docker](https://www.docker.com/).

## Despliegue
Se ha utilizado la plataforma Azure para el despliegue de la aplicación y en la máquina virtual utilizada se ha desplegado la aplicación sobre Docker. La imagen creada para crear el contenedor ha sido creada siguiendo el Dockerfile que se encuentra en este mismo repositorio.

* Ejercicio 1: El dominio utilizado es el provisto por Azure (kc-devops-docker.westeurope.cloudapp.azure.com) o por la IP fija asignada igualmente por Azure (168.63.111.54). Dado que no hemos usado dominios o subdominios propios hemos usado el puerto 8080 para servir este contenido.
  * Archivo estático: [Hojas de estilo](http://kc-devops-docker.westeurope.cloudapp.azure.com:8080/stylesheets/style.css)
  * Archivo estático: [Imagen](http://168.63.111.54:8080/images/ads/bici.png)
  * Llamada a la API: (POST) [users/authenticate](http://168.63.111.54:8080/apiv1/users/authenticate)
  
Otros aspectos a tener en cuenta son que los archivos estáticos son servidos por NGINX y en la respuesta de la petición se añade la cabecera x-owner: smarrerof. y que la llamada a la API es respondida por Express.

* Ejercicio 2: El dominio utilizado es el provisto por Azure (kc-devops-docker.westeurope.cloudapp.azure.com) o por la IP fija asignada igualmente por Azure (168.63.111.54). Dado que no hemos usado dominios o subdominios propios hemos usado el puerto 8080 para servir el contenido estático.
  * Página estática: [http://kc-devops-docker.westeurope.cloudapp.azure.com](http://kc-devops-docker.westeurope.cloudapp.azure.com)
  * Página estática: [http://168.63.111.54](http://168.63.111.54)

### Otros aspectos del despliegue
* Por seguridad se ha cerrado el puerto 22 (SSH)

### Lista de tareas por hacer (en un futuro no muy lejano...)
* Todas las llamadas a http deberían ser redirigidas a https
* Se debería usar algun dominio/subdmonio propio para el evitar el uso del puerto 8080.
* Todos los servicios corren en el mismo contenedor. Pese a que para el objetivo de esta práctica es más que suficiente, no es una buena práctica ya que nos permite el escalado de la aplicación. Para solucionarlo habría que hacer un depliegue usando varios contenedor usando para ellos [Docker Compose](https://docs.docker.com/compose/). Una primera aproximación sería
  * Contenedor para NGINX (en este contenedor podríamos servir el contenido estático)
  * Contenedor para servir la aplicacion con node
  * Contenedor para MongoDB.

## Comandos útiles usando en el desarrollo de esta práctica. 
Están más que nada como recordatorio en usos futuros :) 
### Tareas comunes
```
.\bin\dos2unix.exe .\start.sh
```

### Ejecutar una imagen
DEV (WIN)
```
docker run -v c:/docker/html:/var/www/html -p 80:80 -p 8080:8080 -p 27017:27017 -ti nodepop bin/bash
docker run -v c:/docker/html:/var/www/html -p 80:80 -p 8080:8080 -p 27017:27017 -tid nodepop

docker run -v c:/docker/html:/var/www/html -v c:/docker/nodepop:/var/www/nodepop -p 80:80 -p 8080:8080 -p 27017:27017 -ti nodepop bin/bash
docker run --name nodepop_dev -v c:/docker/html:/var/www/html -v c:/docker/nodepop:/var/www/nodepop -p 80:80 -p 8080:8080 -p 27017:27017 -tid nodepop
```

VM (UBUNTU)
```
sudo docker run -v /home/web/html:/var/www/html -v /home/web/nodepop:/var/www/nodepop -p 80:80 -p 8080:8080 -p 27017:27017 -ti smarrerof/nodepop bin/bash
sudo docker run --name nodepop_dev --restart always -v /home/web/html:/var/www/html -v /home/web/nodepop:/var/www/nodepop -p 80:80 -p 8080:8080 -p 27017:27017 -tid smarrerof/nodepop 
```

### Construir una imagen
```
docker build -t nodepop .
```

### Publicar una imagen
```
docker login
docker tag nodepop smarrerof/nodepop
docker push smarrerof/nodepop
```

### Misc
```
docker container prune
```
