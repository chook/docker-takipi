#!/bin/bash

# Setup Takipi key and name
/opt/takipi/etc/takipi-setup-machine-name ${AWS_REGION}
/opt/takipi/etc/takipi-setup-remote 9090
/opt/takipi/etc/takipi-setup-package ${TAKIPI_KEY}
/opt/takipi/bin/takipi-service -nfd