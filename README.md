# basics
Create a simple python project and containerize it.

# steps to create a basic python project using poetry
0. Create a project on github.com.
1. Download the project from github.com
2. Using python developer console, open the project.
3. In the terminal of the project, install peotry. Follow the steps in "https://python-poetry.org/docs/"
4. Check for the poetry installation : poetry --version
5. Run "poetry init" on terminal   
6. The project should now have pyproject.toml file in it.
7. Run "poetry install" on terminal
8. This will create a poetry.lock file containing the dependencies

# steps to create a docker file
0. Create a Dockerfile in the root of the project.
1. Install the python image in the Dockerfile using the latest images. Example "FROM python:3.8.5-slim-buster as base".
   We gave an alias name here as "base" using the as keyword.
2. Setup the working directory using the environment variable - WDIR and give it a path.
3. Install peotry and the dependencies present in it using pyproject.toml and poetry.lock
4. Copy the project and build it.
5. Refer to the Dockerfile in the project for steps.



# steps to create a docker image and a container
0. On the terminal navigate to the repository
1. docker build -t basics . #creates an image for the project by tagging it with the name basics.
2. docker image ls #lists all of the images present. It should contain the basics image in the list.
3. docker create -t -i basics bash #creates a container from the docker image basics.
4. docker ps -a #lists all of the container names and the details available. The status should be created for basics container image
5. docker start <container id> #get the container id from step 4. This will start the docker.
6. docker container ls #should list the started docker container.
7. docker exec -it <container id> /bin/bash #should take you into the container.

# how to run the helloworld.py inside the docker container?
0. Follow the above 1 to 7 steps. Once you run the step 7, it will take you into the container.
1. Navigate to the package where the helloworld.py is present.
2. Run "python helloworld.py" on the cmd. This will print the output of helloworld.py
3. Once done "exit" to exit the docker container.

# Useful commands related to docker.
0. docker container ls #list all of the running docker containers.
1. docker image ls #list all of the docker images.
2. docker ps -a #list all of the docker containers. Irrespective of whether it is running or not.
3. docker build -t <imagename> . #creates a docker image with tag of the image name
4. docker kill <container id> #to kill a container
5. docker stop $(docker ps -a) #to stop all of the containers
6. docker rm $(docker ps -a) #to remove all of the containers
7. docker rmi $(docker image ls) #to remove all of the images

#Pushing a docker image to docker repository
0. docker build -t sptarigopula/st-learnings:basics . #sptarigopula/st-learnings is the docker repo
1. docker push sptarigopula/st-learnings:basics #push the image to the repository
