# Nodepop
Práctica de DevOps del V KeepCoding Startup Engineering Master Bootcamp (2017).

## Comandos útiles
### Tareas comunes
```
.\bin\dos2unix.exe .\start.sh
```

### Ejecutar una imagen
DEV (WIN)
```
docker run -v c:/docker/html:/var/www/html -p 80:80 -p 8080:8080 -ti nodepop bin/bash
docker run -v c:/docker/html:/var/www/html -p 80:80 -p 8080:8080 -tid nodepop

docker run --name nodepop_dev -v c:/docker/html:/var/www/html -p 80:80 -p 8080:8080 -ti nodepop bin/bash
docker run --name nodepop_dev -v c:/docker/html:/var/www/html -p 80:80 -p 8080:8080 -tid nodepop
```

VM (UBUNTU)
```
sudo docker run --name nodepop_dev -v /home/web/html:/var/www/html -p 80:80 -p 8080:8080 -p 27017:27017 -ti smarrerof/nodepop bin/bash
sudo docker run --name nodepop_dev --restart always -v /home/web/html:/var/www/html -p 80:80 -p 8080:8080 -p 27017:27017 -tid smarrerof/nodepop 
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
