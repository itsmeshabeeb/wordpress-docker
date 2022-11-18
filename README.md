# wordpress-docker
deploying wordpress and mysql in docker container and setting up it.


run below command to colne this repo:


git clone https://github.com/itsmeshabeeb/wordpress-docker.git



1. run docker-install.sh to install docker in your amazon linux 2


1. Setup Mysql

Now that we have docker installed, we can install mysql database using the official mysql docker image.

docker run --name shabeeb-mysql -e MYSQL_ROOT_PASSWORD=shabeeb -d mysql

Run "docker container ls" to check if the container is successfully created and running. If it does, let’s add a new database for our Wordpress by executing mysql in the container.


2. execute the commands inside the docker by running below command.
docker exec -it shabeeb-mysql mysql -u root -p


3. enter the password. 

4. now we have to create new database in db.
create database wordpress;

5. we are creating  wordress container from latest image,

docker pull wordpress
docker run --name shabeeb-wordpress -p 8080:80 -d wordpress

try to access publicip:8080 and give the username,password and databasename and hostname.

Now, we will encounter an “error establishing a database connection” if we use localhost as our Database Host. That is because our mysql database is inside a separate docker container that is not accessible from the wordpress container.


6. creating a network.
docker network create --attachable shabeeb-network

7. adding those caontainers inside this network.
docker network connect shabeeb-network shabeeb-mysql
docker network connect shabeeb-network shabeeb-wordpress

now the container network is changed to shabeeb-network.
Now, let’s go back to the wordpress wizard in our browser and set shabeeb-mysql as the Database Host. We should be able to continue the wizard and have Wordpress up and running.




username :root
password :shabeeb
database :wordpress
host     :shabeeb-mysql
