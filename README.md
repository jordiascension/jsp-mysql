-A basic tutorial on running a web app on Tomcat using Docker
https://github.com/terrestris/docker-tomcat/blob/master/Dockerfile

-Steps
Install Docker.
Go to Dockerfile directory
docker build -t jordiascension/mywebapp:1.0 .

docker run -p 8081:8080 jordiascension/mywebapp:1.0  

docker run -p 8081:8080 -e Entorno=pro jordiascension/mywebapp:1.0  

http://localhost:8081/webapp/

docker push jordiascension/mywebapp:1.0

-Deploy a war file to Heroku

C:\Users\jordi\HerokuApp>heroku create
Creating app... done, ⬢ floating-retreat-39977
https://floating-retreat-39977.herokuapp.com/ | https://git.heroku.com/floating-retreat-39977.git

C:\Users\jordi\HerokuApp>heroku plugins:install java
Installing plugin java... installed v3.1.1

C:\Users\jordi\HerokuApp>heroku war:deploy C:\Users\jordi\eclipse-workspace-2021\webapp\target\webapp.war --app floating-retreat-39977
Uploading webapp.war


- Configure environment variables with heroku and docker

https://medium.com/travis-on-docker/how-to-run-dockerized-apps-on-heroku-and-its-pretty-great-76e07e610e22

heroku config -a floating-retreat-39977

heroku config:set Entorno=pro -a floating-retreat-39977