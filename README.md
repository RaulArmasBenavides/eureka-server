# eureka-server
Eureka Server ( Discovery service) 



Eureka runs locally:

http://localhost:8761


docker build -t eureka-server .
docker run -d -p 8761:8761 --name eureka-server eureka-server