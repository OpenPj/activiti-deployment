@ECHO OFF

IF [%1]==[] (
    echo "Usage: %0 {start|stop|purge|tail|download}"
    GOTO END
)

IF %1==start (
    CALL :start
    CALL :tail
    GOTO END
)
IF %1==stop (
    CALL :down
    GOTO END
)
IF %1==purge (
    CALL:down
    CALL:purge
    GOTO END
)
IF %1==tail (
    CALL :tail
    GOTO END
)

IF %1==download (
    CALL :download
    GOTO END
)
echo "Usage: %0 {start|stop|purge|tail|download}"
:END
EXIT /B %ERRORLEVEL%

:start
    docker volume create activiti-admin-db-volume
    docker volume create activiti-db-volume
    docker volume create activiti-contentstore-volume
    docker-compose up --build -d
EXIT /B 0
:down
    docker-compose -f "%COMPOSE_FILE_PATH%" down
EXIT /B 0
:tail
    docker-compose logs -f
EXIT /B 0
:tail_all
    docker-compose logs --tail="all"
EXIT /B 0
:purge
    docker volume rm activiti-admin-db-volume
    docker volume rm activiti-db-volume
    docker volume rm activiti-contentstore-volume
EXIT /B 0
:download
	curl.exe -o jdbc-driver/postgresql-42.3.1.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.3.1/postgresql-42.3.1.jar
	curl.exe -o wars/activiti-admin.war https://repo1.maven.org/maven2/org/activiti/activiti-admin/6.0.0/activiti-admin-6.0.0.war
	curl.exe -o wars/activiti-app.war https://repo1.maven.org/maven2/org/activiti/activiti-app/6.0.0/activiti-app-6.0.0.war
	curl.exe -o wars/activiti-rest.war https://repo1.maven.org/maven2/org/activiti/activiti-webapp-rest2/6.0.0/activiti-webapp-rest2-6.0.0.war
EXIT /B 0