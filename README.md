# MakersBnB

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

-------

## User Stories MVP -1
```
As a user
I want to be able to sign up to MakersBnB.

As a user
I want to be able to log in to Makers BnB

As a user
I want to be able to list a space to rent out giving a name, description and nightly cost

As a user
I want to be able to see avialble spaces to rent
```
-----
## User Stories MVP -2
```
  As a property owner
  I can specify a fixed time period that my property is available throughout

  As a renter I can see all dates that the owner
  has specified that the property is avialble throughout

  As a renter
  I can select a request to stay in a property for a single night

  As a property owner
  I can view all rental requests for my property/properties?

  As a renter
  I can see which dates have already been been booked up
  for a given property.
  ```




## MVP Model 
### Views
- Homepage - (+ log in)
- New User (Sign up)
- all Listings
- new Listing
-----

### Features:
- user can post a new listing. (CREATE)
- user can view all listings in reverse chronological order. (READ)
- user can sign up for MakersBnB.

-----

### Domain Relationships
- ONE MakersBnB has MANY Users
|MakersBnB|---≡|Users|  

- ONE User has MANY listings
|user|---≡|listings|  

- ONE Listing has MANY Booking_Requests
|listing|---≡|Booking_Requests| 

------

### Class Responsibility Collaborator (CRC) Models

- Table: Listings  
| id |  property  | description | cost | user_id |  

- knows about: Users  

------
- Table: Users  
| id | email | user_name | first_name | last_name | password (encrypted) |  

------
- Table: Availability  
| id | listing_id | start_date | end_date | 

- knows about: Listings, Bookings, Booking_requests 

------
- Table: Booking_Requests  
| id | listing_id | user_id | requested_date | 

- knows about: Users, Listings  

------
- Table: Bookings   
| id | listing_id | user_id | date | 

- knows about: Users, Listings  

------

### Class Diagram

|MakersBnB| - > | User | -> | Listing |    
  
| Listing | -> | Booking_Requests |  
| Listing | -> | Availability |  

------

 ## Technologies used:

------

------
## How to set up the project:

## Setup

Git clone this repo.

Make sure you have postgrl installed and run the two commands below in the terminal:

CREATE DATABASE MakersBnB_development
CREATE DATABASE MakersBnB_test
After this open the repo in your favourite editor and run bundle install to install all gem dependencies.

CD into the repo and run the command rackup in the terminal.

Navigate to http://localhost:9292 within your favourite browser. Enjoy!


------
