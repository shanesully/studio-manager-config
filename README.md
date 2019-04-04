# Studio Manager

A simple Spring Book microservices application for managing a fitness studio

This guide is written for __macOS/Linux__. If you use __Windows__, I suggest you follow using __Git Bash__

# Architecture

![Alt text](images/studio-manager-serious-architectural-diagram.png?raw=true "Title")

## Installation
### Automatic

To install the apps automatically, clone this repo and run the following script:

__'./studio-manager-autoinstall.sh'__

This will clone the API's, checkout release tags, run their tests and build them

### Manual

To install the apps manually, run the following shell commands...

__mkdir studio-manager && cd studio manager__

#### Build the Classes API

Run the following shell commands:

__git clone https://github.com/shanesully/studio-manager-classes-api.git && cd studio-manager-classes-api__
__git checkout feature/create-class-api__
__mvn clean install__
__cd ..__

#### Build the Bookings API

Run the following shell commands:

__git clone https://github.com/shanesully/studio-manager-bookings-api.git && cd studio-manager-bookings-api__
__git checkout feature/create-bookings-api__
__mvn clean install__
__cd ..__

These two microservices comprise the app

### Execute Integration Tests

To execute either API's tests manually, run the following command from the respective API directory:

__mvn test__

Each microservice is setup to be tested in isolation, with it's service dependencies fully mocked using __Mockito__

### Run Microservices

#### Studio Manager - Classes API

To run the Classes API, change to it's respective directory and run the following command:

__mvn spring-boot:run & >/dev/null__

This will start the Classes API Spring Boot microservice and run it as a background process


The __Classes API__ is configured to run on _http://localhost:8080_, which can be queried via __Postman__ (Below)

#### Studio Manager - Bookings API

To run the Bookings API, change to it's respective directory and run the following command:

__mvn spring-boot:run & >/dev/null__

This will start the Bookings API Spring Boot microservice and run it as a background process

The __Bookings API__ is configured to run on _http://localhost:8090_, which can be queried via __Postman__ (Below)

## System Testing

To test the real, running API's:

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
