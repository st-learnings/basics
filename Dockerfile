#Install python image
FROM python:3.8.5-slim-buster as base

#Setup the working director
ENV WDIR /opt/repos/basics/
WORKDIR $WDIR

#Install peotry.
#This layer is rebuilt only when any of the dependencies changes
RUN pip install poetry
COPY pyproject.toml poetry.lock /opt/repos/basics/

#Copy the entire project and build it
##This is rebuilt when a file changes in the project directory
COPY . $WDIR
RUN poetry install
