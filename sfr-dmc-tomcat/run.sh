#!/bin/bash

operation=$1
#groupId=$2
#artifactId=$3
#versionId=$4
#artifactType=$5
export groupId=fr.sfr.bt.sh.dmc
export artifactId=eDMC
export versionId=2.7.1
export artifactType=war

case $operation in 
	start)
        #sh download.sh
		#groupId artifactId versionId artifactType
		COMPOSE_ENV_FILES=.env && docker-compose up --remove-orphans --force-recreate &
        #docker cp /home/desktop/sfr/projects/eDMC/target/devConfig eDMC:/
        docker cp /home/desktop/sfr/projects/eDMC/target/eDMC-2.7.2-SNAPSHOT.war eDMC:/usr/local/tomcat/webapps/eDMC.war
		;;
	stop)
		docker-compose down --rmi local
		;;
	*)
		echo "Must pass one of the args start|stop"
		;;
esac
