# Studio Manager

A simple Spring Book microservices application for managing a fitness studio

This guide is written for __macOS/Linux__. If you use __Windows__, I suggest you follow using __Git Bash__

## Installation
### Automatic

To install the apps automatically, clone this repo and run the following script:

__'./studio-manager-autoinstall.sh'__

This will clone the API's, checkout release tags, run their tests and build them

### Manual

To install the apps manually, run the following shell commands...

mkdir studio-manager && cd studio manager

__git clone https://github.com/shanesully/studio-manager-classes-api.git__
__git clone https://github.com/shanesully/studio-manager-bookings-api.git__

These two microservices that compose the application

__cd studio-manager-classes-api && mvn clean install__
__mvn spring-boot:run__

This will run tests and start the Studio Manager Classes API on _'http://localhost:8080'_

__cd ../studio-manager-bookings-api && mvn clean install__
__mvn spring-boot:run__

This will run tests and start the  Studio Manager Bookings API on _'http://localhost:8090'_

## Testing
### System Testing

1. Install __Postman__: https://www.getpostman.com/downloads/
2. Import the __Postman Collections__:

_Import -> Import From Link -> https://www.getpostman.com/collections/be3eb3356b31a3c2d885_ (Classes API)

_Import -> Import From Link -> https://www.getpostman.com/collections/aee5e9583ba50b95e289_ (Bookings API)

## Info
### Some simple rules:
* You can't book a class that doesn't exist
* You can't delete a class that has bookings
* You can delete a class that has no bookings
* You can make a maximum of {{class.capacity}} bookings against a class
* _Creating_ a booking increments __{{class.capacity}}__
* _Deleting_ a booking decrements __{{class.capacity}}__
* When creating a _class_, __{{class.id}}__ is automatically assigned
* When creating a _booking_, __{{booking.id}}__ is automatically assigned
