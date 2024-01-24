#!/bin/bash

#groupId=$1
#artifactId=$2
#versionId=$3
#artifactType=$4
#groupId=fr.sfr.bt.sh.dmc
#artifactId=eDMC
#versionId=2.7.1
#artifactType=war

GROUP_ID=$(echo "$groupId" |  tr '.' '/')
ARTIFACT_ID=$artifactId
VERSION_ID=$versionId
ARTIFACT_TYPE=$artifactType



eval export $(cat .env)
echo $LOCAL_REPO
echo $LOCAL_CONFIG_DIR
echo $LOCAL_BIN_DIR
artifactFolder=$LOCAL_REPO/$GROUP_ID/$ARTIFACT_ID/$VERSION_ID
echo artifactFolder=$artifactFolder
fullLocalArtifactPath=$artifactFolder/$ARTIFACT_ID-$VERSION_ID.$ARTIFACT_TYPE
echo fullLocalArtifactPath=$fullLocalArtifactPath
fullRemoteArtifactPath=$REPO_URL/$GROUP_ID/$ARTIFACT_ID/$VERSION_ID/$ARTIFACT_ID-$VERSION_ID.$ARTIFACT_TYPE
echo fullRemoteArtifactPath=$fullRemoteArtifactPath
echo $LOCAL_BIN_DIR
mkdir -p $artifactFolder
curl -o $fullLocalArtifactPath $fullRemoteArtifactPath
mkdir -p $LOCAL_BIN_DIR/$ARTIFACT_ID/
cp $fullLocalArtifactPath $LOCAL_BIN_DIR/$ARTIFACT_ID/$ARTIFACT_ID.$ARTIFACT_TYPE
