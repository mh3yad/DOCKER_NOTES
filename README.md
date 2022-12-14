# Docker and Kubernetes

## Info

* in VM there's alot of resources that doesn't required, I want just to run my app so we will depend on OS kerenl and only install required dependencies
* it's a way to bundle app with its requirements and dependencies
* based on linux `cgroup` => control processes resources and `namespace` that isolate processes and its child.
* `docker run -it --name cont_name -p80:80 (port) -v volume|absolute_path$(pwd):/location_in_container --network (network name) --add-host host:ip img command`

## Images

```bash
docker image pull img -> pull img from docker hub 
docker image ls
docker image rm | docker rmi
docker build . -t image_name
docker commit container img_name -> create img
docker image tag img mh3yad/tag_img -> new tag for existing img
docker image push mh3yad/tag_img -> push to docker hub
```

## Containers

```bash
docker create img 
docker container start
docker container ls
docker container rm
docker container run = (pull + create + start)
docker container exec -it  bash
docker container attach
docker container inspect
docker container rm $(docker container ls -aq) -f delete all containers

```

## Volumes

```bash
docker volume create => saved in /var/lib/docker/volumes
```

## Networks

```bash
docker network create --subnet 10.10.10.0/24 name 
docker network connect|disconnect network container
```

## Dockerfile

```dockerfile
FROM python|ubuntu:18.4|mh3yad/flask_app:latest

WORKDIR /app

ADD requirements . remote URL support

COPY file1 file.* .

RUN ["command","arg1","arg2"]
RUN pip install -r requirements

ENV key value
ENV key=value

ENTRYPOINT [ "/bin/bash", "-c"]

CMD [ "python","app.py" ] cmd is arg for entrypoint and both do the same
```

## docker-compose.yml

```bash
docker compose build .
docker compose up -d
docker compose down
```

```yaml
version: '3.1'

services:
  app_flask:
   build: .
   ports:
     - 5000:5000
   volumes:
    - flask_v
   networks:
    - flask_network
  redis:
    image: redis
    networks:
      - flask_network 

volumes:
   flask_v:

networks:
  flask_network:

```