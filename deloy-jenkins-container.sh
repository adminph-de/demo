
# create Jenkins Container
docker run --name jenkins -p 8080:8080 -p 50000:50000 -d -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home jenkins/jenkins:lts

docker run --name jenkins -p 8080:8080 -p 50000:50000 -d -v /var/run/docker.sock:/var/run/docker.sock -v jenkins_home:/var/jenkins_home jenkins-master:alpha-1.0

# install DOCKER
docker exec -u root -t jenkins apt-get update
docker exec -u root -t jenkins apt-get install docker.io

# add local DOCKER SOCKET to the container
docker exec --user root jenkins chmod 777 /var/run/docker.sock

# Deploy NOVO NORDISK zSCALER Cerificate
docker cp /usr/local/share/ca-certificates/ZscalerRootCertificate-2048-SHA256.crt jenkins:/usr/local/share/ca-certificates/
docker exec -u root -t jenkins update-ca-certificates