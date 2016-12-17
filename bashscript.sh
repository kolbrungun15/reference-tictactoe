#!/bin/bash

# - npm build
# - build a docker image which includes the build output - not including node-modules.
# - runs npm install for the server.

echo Cleaning... # Skrifar útá skjá "cleaning"
sudo rm -rf ./build    #eyðir núvendandi build möppu

#sækir textann sem tilheyrir nýjasta committi á git og merkir imageið með sama texta svo hægt sér að rollbacka.
if [ -z "$GIT_COMMIT" ]; then
  export GIT_COMMIT=$(git rev-parse HEAD)
  export GIT_URL=$(git config --get remote.origin.url)
fi

# Remove .git from url in order to get https link to repo (assumes https url for GitHub)
export GITHUB_URL=$(echo $GIT_URL | rev | cut -c 5- | rev)

npm install --silent
cd client
npm install --silent
cd ..

echo Building app  #skrifar út á skjá "Building app"
npm run build #buildar verkefnið

#ef build failar þá er skrifað út á skjá :"Npm build failed with exit code "
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Npm build failed with exit code " $rc
    exit $rc
fi


mkdir build #býr til nýja build möppu

#taggið á commitinu sett inn í tímabundna textastrá
cat > ./build/githash.txt <<_EOF_ 
$GIT_COMMIT
_EOF_

cat > ./build/.env << _EOF_
GIT_COMMIT=$GIT_COMMIT
_EOF_

mkdir build/public #Býr til public möppu inní build
#býr til html skjal
cat > ./build/public/version.html << _EOF_
<!doctype html>
<head>
   <title>App version information</title>
</head>
<body>
   <span>Origin:</span> <span>$GITHUB_URL</span>
   <span>Revision:</span> <span>$GIT_COMMIT</span>
   <p>
   <div><a href="$GITHUB_URL/commits/$GIT_COMMIT">History of current version</a></div>
</body>
_EOF_


cp ./Dockerfile ./build/ #copy-ar docker file skjalið og setur inn í build möppuna
cp docker-run.sh ./build/ #copy-ar docker-run og setur inn í build möppuna
cp ./package.json ./build/ #copy-ar package.json og setur inn'i build möppuna 
cp docker-compose.yml ./build/ 

cd build #fer inn í build möppuna
echo Building docker image #skrifar út á skjáinn "Building docker image"

sudo docker build -t kollagunn/tictactoe:$GIT_COMMIT . #docker build 

#Skrifar út á skjá ef buildið feilar
rc=$?
if [[ $rc != 0 ]] ; then
    echo "Docker build failed " $rc
    exit $rc
fi

#pushar inn á docker
#sudo docker push kollagunn/tictactoe:$GIT_COMMIT
#rc=$?
#if [[ $rc != 0 ]] ; then
#    echo "Docker push failed " $rc
#   exit $rc
#fi

echo "Done"