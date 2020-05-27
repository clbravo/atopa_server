#! /bin/bash

ATOPA_SERVER_PATH=~/atopa/atopa_server

get_ATOPA_SERVER()
{

	if [ -d $ATOPA_SERVER_PATH ];
	then
		echo "Cambiado al directorio"  $ATOPA_SERVER_PATH
		cd $ATOPA_SERVER_PATH
		git pull
	else
		echo "Primero debe instalar la aplicacion (instalador_atopa_servidor.sh)"
		exit
	fi
}


#Actualiza la aplicacion atopa
get_ATOPA_SERVER

cd $ATOPA_SERVER_PATH

STATE=$(sudo  docker container inspect atopaserver -f '{{.State.Status}}')
#echo $STATE

if [[ $STATE == *running* ]]
then
        sudo make restart
else
         sudo make up
fi
