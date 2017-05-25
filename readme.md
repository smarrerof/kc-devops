# Nodepop
Práctica de DevOps del V KeepCoding Startup Engineering Master Bootcamp (2017).

## Comandos útiles
### Tareas comunes
```
docker build -t nodepop .
docker run --name nodepop_run -p 80:80 -i -t nodepop
docker run --name nodepop_run -p 80:80 -i -t nodepop /bin/bash
docker container prune
```
### Publicar un contenedor
```
docker login
docker tag nodepop smarrerof/nodepop
docker push smarrerof/nodepop
```