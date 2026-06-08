# Docker Labs

## MongoDB + Backend + Frontend con Docker y Docker Compose

Este repositorio contiene la resolución de los laboratorios de Docker.
---

## Estructura del proyecto

01_Docker_Things/
├── backend/
├── frontend/
├── docker-compose.yml
└── README.md

---

## Reto 1: MongoDB en Contenedor

docker network create lemoncode-network

docker run -d \
  --name mongo \
  --network lemoncode-network \
  -p 27017:27017 \
  mongo:4.4

---

## Reto 2: Backend

docker build -t backend-app .

docker run -d \
  --name backend \
  --network lemoncode-network \
  -p 5000:5000 \
  -e MONGO_URL=mongodb://mongo:27017/ClassesDb \
  topics-api

---

## Reto 3: Frontend

docker build -t frontend-app .

docker run -d \
  --name frontend \
  --network lemoncode-network \
  -p 3000:3000 \
  -e API_URL=http://backend:5000/api/classes \
  frontend-app

## Reto 4: Docker Compose

docker compose up --build

## URLs

Frontend: http://localhost:3000
Backend: http://localhost:5000/api/classes
MongoDB: localhost:27017

