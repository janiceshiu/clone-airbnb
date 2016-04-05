# AirBnB Clone
* First Rails app
* A solo project for NEXT Academy's January 2016 bootcamp
* Coded from 24 Feb 2016 to 07 Mar 2016

## Stack
#### Back End
* Ruby 2.2
* Rails 4.2.5.2
* Postgresql database 0.18.4

### Front End
* Bootstrap-sass 3.3.6

## APIs
* Google Maps

## App Features

### Sign Up / Log In (with Clearance and Omniauth Facebook)
* User signs up (and is immediately logged in) OR user logs in
* User can sign up or log in with their Facebook account

### User Profile
* User can upload and change an avatar

### Listings
* User can create a listing (mirrors AirBnB's listing flow)
    * Only the property type, room type, number of guests, and city is required. By default, a listing is unpublished.
    * The listing can only be published after the user has added other details such as a listing description
    * When the user keys in their listing's address, Google Maps will try to autocomplete it for them. (Uses Google Maps' Javascript API)
* User can edit, view, and delete their listings.
* User can upload multiple images at once for their listings
* User can view all their listings


### Search Listings (with Elasticsearch)
* User can search for listings. If no listings are found, the user will be shown all published listings.
* Each published listing shows details of the listing (eg: city, rent, images, etc)
* User can see the listing's Google Map location is (mirrors AirBnB's individual listing view)

### Reservations
* User can create a reservation

### Payments (with Gon and Braintree)
* User can pay for their reservation

### Emails (with Sidekiq for asynchronous mailing)
* User receives an email after they have created a reservation

### Images
* Use Carrierwave to upload images
* Use MiniMagick to process images
* Use Amazon Web Services to host images remotely


### Security
Use Figaro to hide configuration environmental variables (eg: API keys)

Testing
----------
This app was not developed in a TDD manner. The developer realizes that this is a weakness.

Future Plans
------
* Add tests for the app. (May redo the app so that test can be written as or before the code is written in the red-green-refactor cycle.)
* Ensure that reservations cannot overlap.
* Ensure that authentication and authorization is present for various pages (eg: a user should not be able to reserve another user's unpublished listing.)
* Further develop the front-end. (For this project, the focus was on learning the Rails back-end, learning how to use and customize gems, and learning how to use and customize APIs.) The front end is extremely basic.
* User can edit and delete their reservations.

Developer
----------
* [Janice Shiu](https://github.com/contrepoint)