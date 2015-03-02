docker-takipi
=============

Running Takipi (https://www.takipi.com) inside a Docker container

2015-01-25
----------
Due to https://github.com/docker/docker/issues/2606 I now recommend you use the heroku Dockerfiles as the heroku add-on of Takipi uses less memory (on the expense of error analysis time). 

2015-01-02
----------
Added CentOS/Ubuntu flavors.
Supervisord is considered deprecated in favor of the new plain && approach.

Building the image:
docker build -t TAG .

Running the image:
docker run -d TAG
