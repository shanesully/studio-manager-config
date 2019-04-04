#!/bin/bash

{
	git clone https://github.com/shanesully/studio-manager-classes-api.git && cd studio-manager-classes-api
	git checkout releases/1.0
	mvn clean install
	cd ..
} &> /dev/null
echo 'Studio Manager - Classes API Installed'

{
	git clone https://github.com/shanesully/studio-manager-bookings-api.git && cd studio-manager-bookings-api
	git checkout releases/1.0
	mvn clean install
	cd ..
} &> /dev/null
echo 'Studio Manager - Bookings API Installed'

