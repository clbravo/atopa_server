#! /bin/bash

ATOPA_HOME=~/atopa
ATOPA_SERVER_PATH=$ATOPA_HOME/atopa_server
ATOPA_SERVER_URL=https://github.com/clbravo/atopa_server.git
ATOPA_SERVER_PASS=$1
ATOPA_SERVER_IP=$2
ATOPA_SERVER_PORT=$3

get_ATOPA_SERVER()
{
        if [ -d $ATOPA_HOME ] ;
        then
                echo "Actualizando el directorio" $ATOPA_HOME
                cd $ATOPA_HOME

                if [ -d $ATOPA_SERVER_PATH ];
                then
                        echo "Cambiado al directorio" $ATOPA_SERVER_PATH
                        cd $ATOPA_SERVER_PATH
                        git pull
                else
                        echo "Clonando la aplicacion" $ATOPA_HOME
                        git clone --branch master $ATOPA_SERVER_URL
                fi
        else
                echo "Creando directorio" $ATOPA_HOME
                mkdir $ATOPA_HOME
                cd $ATOPA_HOME
                echo "Clonando la aplicacion " $ATOPA_HOME
                git clone --branch master $ATOPA_SERVER_URL
        fi
}

crearVariablesEntorno()
{
        echo "Creando las variables de entorno ...."
	cd $ATOPA_SERVER_PATH
	
        # Settings
        echo "ENV_PASSWORD=$ATOPA_SERVER_PASS" > .env
        echo "ENV_SERVER_IP=$ATOPA_SERVER_IP" >> .env
        echo "ENV_SERVER_PORT=$ATOPA_SERVER_PORT" >> .env

        # Docker
        echo "ENV_MYSQL_ROOT_PASSWORD=$ATOPA_SERVER_PASS" >> .env

	# Gestion de correo
	echo "ENV_EMAIL_HOST=smtp.gmail.com" >> .env
	echo "ENV_EMAIL_HOST_USER=" >> .env  	 # Asignarle un valor
	echo "ENV_EMAIL_HOST_PASSWORD=" >> .env  # Asignarle un valor
	echo "ENV_EMAIL_PORT=587" >> .env
}


actualizarAccesoBaseDatos()
{
        echo "Dando acceso al nuevo usuario ...."

        SHELL_1="bash -c 'docker exec -it atopaserver_db mysql -h db -u root -p'"
        SHELL_2="bash -c 'docker exec -it atopaserver_db mysql -h db -u root -p$ATOPA_SERVER_PASS'"
        ENTRYPOINT_1="mysql -u root -h db -p --default-character-set=utf8 atopa_app < \/atopa\/mysqldumps\/startDB.sql"
        ENTRYPOINT_2="mysql -u root -h db -p$ATOPA_SERVER_PASS --default-character-set=utf8 atopa_app < \/atopa\/mysqldumps\/startDB.sql"


        cd $ATOPA_SERVER_PATH

        sed "s/$SHELL_1/$SHELL_2/" ./Makefile >./salida
        mv ./salida ./Makefile
        sed "s/$ENTRYPOINT_1/$ENTRYPOINT_2/" ./entrypoint >./salida
        mv ./salida ./entrypoint
	chmod 750 ./entrypoint
}

generarCertificados()
{
	cd $ATOPA_SERVER_PATH
	
        echo 'Generar un certificado [s/N]:'
        read respuesta

        if [[ $respuesta == *s*  ||  $respuesta == *S* ]]
        then
		openssl req -x509 -newkey rsa:4096 -keyout atopa_key.pem -out atopa.pem -days 365 -nodes -config req.conf -sha256
        else
                echo "No se ha generado un certificado"
        fi
}

#Comprobar que se han introducido los valores de user, pass y host
if [ $# -ne 3 ]; 
then 
	echo "Uso: ./instalador_atopa_servidor.sh contraseña ip puerto"
    	exit
fi

#Instala GIT si es necesario
sudo apt install git
sudo apt-get install build-essential
#Clona o actualiza la aplicacion atopa
get_ATOPA_SERVER
crearVariablesEntorno
generarCertificados
actualizarAccesoBaseDatos

chmod 750 ejecutar_atopa_servidor.sh
chmod 750 instalador_atopa_servidor.sh

cd $ATOPA_SERVER_PATH
mkdir ./atopaserver/logs
touch ./atopaserver/logs/debug.log
mkdir ../logs
touch ../logs/debug.log
mkdir ./logs
touch ./logs/debug.log
sudo make build

