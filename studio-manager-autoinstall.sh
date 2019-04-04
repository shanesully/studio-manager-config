#!/bin/bash

{
	mkdir studio-manager && cd studio-manager
	git clone https://github.com/shanesully/studio-manager-classes-api.git && cd studio-manager-classes-api
	git checkout feature/create-class-api
	mvn clean install
} &> /dev/null
echo 'Studio Manager - Classes API Installed'

{
	cd ..
	git clone https://github.com/shanesully/studio-manager-bookings-api.git && cd studio-manager-bookings-api
	git checkout feature/create-bookings-api
	mvn clean install
} &> /dev/null
echo 'Studio Manager - Bookings API Installed'

