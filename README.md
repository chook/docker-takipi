docker-takipi
=============

Running Takipi inside Docker container

Added CentOS/Ubuntu flavors.
Supervisord is considered deprecated in favor of the new plain && approach.

Building the image:
docker build -t TAG .

Running the image:
docker run -d TAG
