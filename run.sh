#!/bin/sh

start() {
    docker volume create activiti-admin-db-volume
    docker volume create activiti-db-volume
    docker volume create activiti-contentstore-volume
    docker-compose up --build -d
}

down() {
        docker-compose down
}

purge() {
    docker volume rm activiti-admin-db-volume
    docker volume rm activiti-db-volume
    docker volume rm activiti-contentstore-volume
}

tail() {
    docker-compose logs -f
}

tail_all() {
    docker-compose logs --tail="all"
}

download() {
	curl -o jdbc-driver/postgresql-42.3.1.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.3.1/postgresql-42.3.1.jar
	curl -o wars/activiti-admin.war https://repo1.maven.org/maven2/org/activiti/activiti-admin/6.0.0/activiti-admin-6.0.0.war
	curl -o wars/activiti-app.war https://repo1.maven.org/maven2/org/activiti/activiti-app/6.0.0/activiti-app-6.0.0.war
	curl -o wars/activiti-rest.war https://repo1.maven.org/maven2/org/activiti/activiti-webapp-rest2/6.0.0/activiti-webapp-rest2-6.0.0.war
}

case "$1" in
  start)
    start
    tail
    ;;
  stop)
    down
    ;;
  purge)
    down
    purge
    ;;
  tail)
    tail
    ;;
  download)
    download
    ;;
  *)
    echo "Usage: $0 {start|stop|purge|tail|download}"
esac