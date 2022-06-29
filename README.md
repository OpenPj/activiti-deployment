# Activiti Docker Deployment v1.0.0

Docker Compose project for deploying the Activiti Platform.
The goal of this project is to help system administrators to manage an Activiti infrastructure deployed with Docker where they also need to configure parameters or install extensions. 

Developers can consider to use our [Activiti SDK](https://github.com/OpenPj/activiti-sdk) to create custom containers.

The architecture template will help you deploying Activiti for you with the following tested components:

* Activiti App 6.0.0
* Activiti Admin 6.0.0
* Activiti Rest 6.0.0
* PostgreSQL 13.1

Each component will have its own Docker Volume for managing the storage:

* `activiti-db-volume`: database storage for activiti-app
* `activiti-contentstore-volume`: file storage for attachments
* `activiti-admin-db-volume`: database storage for activiti-admin

The provided run script will create these volumes for you.

# Quickstart
If you have Docker correctly installed in your system, you can download the default distribution of Activiti and run all the containers with the following command:

```
./run.sh download
./run.sh start
```

# Getting started

Use these instructions to get started with deploying your Activiti Platform with Docker

## Prerequisites
   
Before using this project you have to configure the following components:
* Docker - Latest stable version

### Docker

1. Download and install [Docker](https://docs.docker.com/install/)

2. Verify the installation of Docker:

```
$ docker -v
Docker version 20.10.16, build aa7e414
``` 

3. Docker Compose is included as part of Windows and Mac Docker installers.
For Linux-based users, install both the component separately with the following:

* [Install Docker Engine](https://docs.docker.com/engine/install/)
* [Install Docker Compose](https://docs.docker.com/compose/install/)

4. Verify the installation of Docker Compose

```
$ docker-compose -v
docker-compose version 2.6.0
```

### Activiti WAR artifacts, extensions and licensing

1. Put the JDBC driver used by Activiti in the `jdbc-driver` folder
2. Put your activiti-app.war, activiti-rest.war and activiti-admin.war in the `wars` folder

## Configuration

The structure of the project allows you to configure and install extensions against the APS platform as the following:

* `config`: put here all the Tomcat and Activiti configuration files
* `config/rest`: put here your activiti-rest configuration files
* `jdbc-driver`: put here the JDBC driver for Activiti App, Activiti Rest and Activiti Admin
* `logging`: change your logging strategy here using the specific log4j.properties
* `docker-compose.yml`: change here your deployment structure
* `Dockerfile-app`: change here your container build for activiti-app
* `Dockerfile-rest`: change here your container build for activiti-rest
* `Dockerfile-admin`: change here your continer build for activiti-admin
* `wars`: put here your Activiti App, Activiti Rest and Activiti Admin with your extensions (activiti-app.war, activiti-rest.war, activiti-admin.war, extensions JARs)

For more informations about how to build extensions please see [Alfresco Process Services SDK](https://github.com/OpenPj/alfresco-process-services-project-sdk).

## Getting the default distribution
In order to simplify the adoption of this template, you can execute the following command to download the default distribution of Activiti 6.0.0:

```
./run.sh download
```
After the execution, you should find the following files stored in the project:

```
jdbc-driver/postgresql-42.3.1
wars/activiti-admin.war
wars/activiti-app.war
wars/activiti-rest.war
```

## Deploying your containers

A run script is provided in two formats:

* `run.sh` for Linux and Mac users
* `run.bat` for Windows users

Run the following command to deploy:

```
./run.sh start
```

Stop with:

```
./run.sh stop
```

Purge Docker volumes with:

```
./run.sh purge
```

Return in tail with:

```
./run.sh tail
```

# Sponsorship
This project was created with the sponsorship of [Confcommercio Venezia CAF S.r.l](https://www.confcommercioveneziacaf.it).

# Enterprise support
Official maintenance and support of this project is delivered by Zia Consulting
