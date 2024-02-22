#!/bin/bash

operation=$1
artifactId=$2

case $operation in 
	start)
		#docker-compose -f docker-compose.yml up -d --remove-orphans --force-recreate &
		docker-compose -f docker-compose.yml up --remove-orphans --force-recreate
		;;
	stop)
		docker-compose down --rmi local
		;;
	*)
		echo "Must pass one of the args start|stop"
		;;
esac
