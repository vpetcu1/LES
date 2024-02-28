#!/bin/bash

groupId=$1
artifactId=$2
versionId=$3
artifactType=$4
envId=$5
#groupId=fr.sfr.bt.sh.dmc
#artifactId=eDMC
#versionId=2.7.1
#artifactType=war

GROUP_ID=$(echo "$groupId" |  tr '.' '/')
ARTIFACT_ID=$artifactId
VERSION_ID=$versionId
ARTIFACT_TYPE=$artifactType
ENV_ID=$envId

. ./.env
artifactFolder=$LOCAL_REPO/$GROUP_ID/$ARTIFACT_ID/$VERSION_ID
fullLocalArtifactPath=$artifactFolder/$ARTIFACT_ID-$VERSION_ID.$ARTIFACT_TYPE
fullRemoteArtifactPath=$REPO_URL/$GROUP_ID/$ARTIFACT_ID/$VERSION_ID/$ARTIFACT_ID-$VERSION_ID$ENV_ID.$ARTIFACT_TYPE
echo Download called with params:  $groupId $artifactId $versionId $artifactType $envId
if [ ! -f $fullLocalArtifactPath ]; then
    echo Downloading $fullRemoteArtifactPath to $fullLocalArtifactPath
    mkdir -p $artifactFolder
    curl -o $fullLocalArtifactPath $fullRemoteArtifactPath
    mkdir -p $LOCAL_BIN_DIR/$ARTIFACT_ID/
    cp $fullLocalArtifactPath $LOCAL_BIN_DIR/$ARTIFACT_ID/$ARTIFACT_ID.$ARTIFACT_TYPE
fi