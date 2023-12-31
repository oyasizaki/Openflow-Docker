@echo off
if not exist "offline" mkdir offline
docker-compose -f docker-compose-traefik-offline-cache.yml -p cache up -d
pause
docker pull mongo
docker image tag mongo:latest localhost:5000/mongo:latest
docker image push localhost:5000/mongo:latest

docker pull traefik
docker image tag traefik:latest localhost:5000/traefik:latest
docker image push localhost:5000/traefik:latest

docker pull rabbitmq:3-management
docker image tag rabbitmq:3-management localhost:5000/rabbitmq:3-management
docker image push localhost:5000/rabbitmq:3-management

docker pull verdaccio/verdaccio
docker image tag verdaccio/verdaccio:latest localhost:5000/verdaccio/verdaccio
docker image push localhost:5000/verdaccio/verdaccio

docker pull iegomez/mosquitto-go-auth
docker image tag iegomez/mosquitto-go-auth:latest localhost:5000/iegomez/mosquitto-go-auth
docker image push localhost:5000/iegomez/mosquitto-go-auth



docker pull openiap/openflow:latest
docker image tag openiap/openflow:latest localhost:5000/openiap/openflow:latest
docker image push localhost:5000/openiap/openflow:latest

docker pull openiap/nodered:latest
docker image tag openiap/nodered:latest localhost:5000/openiap/nodered:latest
docker image push localhost:5000/openiap/nodered:latest
