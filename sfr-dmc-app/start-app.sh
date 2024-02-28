#!/bin/bash
# Set comma as delimiter

file="versions.txt"
lines=`cat $file`
for line in $lines; do
    readarray -d "|" -t token <<< "$line"
    groupId=${token[0]}
    artifactId=${token[1]}
    versionId=${token[2]}
    envId=${token[3]}
    artifactType=${token[4]}
    echo groupId=$groupId
    echo artifactId=$artifactId
    echo versionId=$versionId
    echo artifactType=$artifactType
    echo envId=$envId
    sh download.sh $groupId $artifactId $versionId $artifactType $envId
done
sh run-app.sh start
