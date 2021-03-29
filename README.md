A basic tutorial on running a web app on Tomcat using Docker
https://github.com/terrestris/docker-tomcat/blob/master/Dockerfile

Steps
Install Docker.
Go to Dockerfile directory
docker build -t jordiascension/mywebapp:1.0 .
docker run -p 8081:8080 jordiascension/mywebapp:1.0    
http://localhost:8081/webapp/

docker push jordiascension/mywebapp:1.0