@ECHO OFF

echo ¿Qué parámetro desea cambiar?
echo 1. Contraseña
echo 2. Ip del servidor
echo 3. Puerto del servidor
echo 4. Usuario y contraseña email
set /P option=Introduzca el número correspondiente con su opción elegida (1-4):

IF "%option%"=="1" (goto pass)
IF "%option%"=="2" (goto ipserver)
IF "%option%"=="3" (goto port)
IF "%option%"=="4" (goto email)
goto :eof


:pass
set /P pass=Introduzca su contraseña:
echo ENV_PASSWORD=%pass% > .env2
echo ENV_MYSQL_ROOT_PASSWORD=%pass% >>.env2
for /f "usebackq tokens=1-2 delims==" %%a in (.env) do (
    if /i "%%a"=="ENV_SERVER_IP" (
        echo ENV_SERVER_IP=%%b >> .env2
    ) else if /i "%%a"=="ENV_SERVER_PORT" (
        echo ENV_SERVER_PORT=%%b >> .env2
    ) else if /i "%%a"=="ENV_LOCAL_IP" (
        echo ENV_LOCAL_IP=%%b >> .env2
    ) else if /i "%%a"=="ENV_EMAIL_HOST_USER" (
        echo ENV_EMAIL_HOST_USER=%%b >> .env2
    ) else if /i "%%a"=="ENV_EMAIL_HOST_PASSWORD" (
        echo ENV_EMAIL_HOST_PASSWORD=%%b >> .env2
    )
)
del .env
ren ".env2" ".env"
echo ENV_EMAIL_HOST=smtp.gmail.com >> .env
echo ENV_EMAIL_PORT=587 >> .env
goto :fin

:ipserver
echo ¿Cómo se conecta a Internet?
echo 1. Wi-Fi
echo 2. Cable Ethernet
set /P wifi=Introduzca el número correspondiente con su opción elegida (1-2):
setlocal enabledelayedexpansion
IF "%wifi%"=="1" (goto wifi)
IF "%wifi%"=="2" (goto ether)
goto :ipserver
:wifi
set adapter=Wi-Fi
goto next
:ether
set "adapter=Ethernet Ethernet"
:next
set adapterfound=false
set ipserver=""
echo Network Connection Test
for /f "usebackq tokens=1-2 delims=:" %%f in (`ipconfig`) do (
    set "item=%%f"
    if /i not "x!item:%adapter%=!"=="x!item!" (
        set adapterfound=true
    ) else if not "!item!"=="!item:IPv4=!" if "!adapterfound!"=="true" (
        echo Tu dirección IP es: %%g
        set ipserver=%%g
        set adapterfound=false
    )
)

if %ipserver%=="" (
    setlocal disabledelayedexpansion
    echo No se pudo encontrar la ip
    set /P ipserver=Introduzca su ip:
) else (
    set ipserver=%ipserver:~1%
)
for /f "usebackq tokens=1-2 delims==" %%a in (.env) do (
    if /i "%%a"=="ENV_SERVER_PORT" (
        echo ENV_SERVER_PORT=%%b >> .env2
    ) else if /i "%%a"=="ENV_PASSWORD" (
        echo ENV_PASSWORD=%%b > .env2
        echo ENV_MYSQL_ROOT_PASSWORD=%%b >> .env2
        echo ENV_SERVER_IP=%ipserver% >> .env2
    ) else if /i "%%a"=="ENV_LOCAL_IP" (
        echo ENV_LOCAL_IP=%%b >> .env2
    ) else if /i "%%a"=="ENV_EMAIL_HOST_USER" (
        echo ENV_EMAIL_HOST_USER=%%b >> .env2
    ) else if /i "%%a"=="ENV_EMAIL_HOST_PASSWORD" (
        echo ENV_EMAIL_HOST_PASSWORD=%%b >> .env2
    )
)
del .env
ren ".env2" ".env"
echo ENV_EMAIL_HOST=smtp.gmail.com >> .env
echo ENV_EMAIL_PORT=587 >> .env
goto :fin

:port
set /P port=Introduzca el puerto del servidor:
for /f "usebackq tokens=1-2 delims==" %%a in (.env) do (
    if /i "%%a"=="ENV_SERVER_IP" (
        echo ENV_SERVER_IP=%%b >> .env2
        echo ENV_SERVER_PORT=%port% >> .env2
    ) else if /i "%%a"=="ENV_PASSWORD" (
        echo ENV_PASSWORD=%%b > .env2
        echo ENV_MYSQL_ROOT_PASSWORD=%%b >> .env2
    ) else if /i "%%a"=="ENV_LOCAL_IP" (
        echo ENV_LOCAL_IP=%%b >> .env2
    ) else if /i "%%a"=="ENV_EMAIL_HOST_USER" (
        echo ENV_EMAIL_HOST_USER=%%b >> .env2
    ) else if /i "%%a"=="ENV_EMAIL_HOST_PASSWORD" (
        echo ENV_EMAIL_HOST_PASSWORD=%%b >> .env2
    )
)
del .env
ren ".env2" ".env"
echo ENV_EMAIL_HOST=smtp.gmail.com >> .env
echo ENV_EMAIL_PORT=587 >> .env
goto :fin

:email
set /P email=Introduzca la cuenta de correo:
set /P passemail=Introduzca la contraseña de la cuenta de correo:
for /f "usebackq tokens=1-2 delims==" %%a in (.env) do (
    if /i "%%a"=="ENV_SERVER_IP" (
        echo ENV_SERVER_IP=%%b >> .env2
    ) else if /i "%%a"=="ENV_PASSWORD" (
        echo ENV_PASSWORD=%%b > .env2
        echo ENV_MYSQL_ROOT_PASSWORD=%%b >> .env2
    ) else if /i "%%a"=="ENV_LOCAL_IP" (
        echo ENV_LOCAL_IP=%%b >> .env2
    ) else if /i "%%a"=="ENV_SERVER_PORT" (
        echo ENV_SERVER_PORT=%%b >> .env2
    )
)
del .env
ren ".env2" ".env"
echo ENV_EMAIL_HOST_USER=%email% >> .env  	 
echo ENV_EMAIL_HOST_PASSWORD=%passemail% >> .env
echo ENV_EMAIL_HOST=smtp.gmail.com >> .env
echo ENV_EMAIL_PORT=587 >> .env
goto :fin

:fin
docker-compose down
docker-compose up -d
set /p=Cambios realizados correctamente. Pulse ENTER para cerrar...
