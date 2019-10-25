# MakersBnB

  A web application that allows users to rent out and book available properties at a nightly cost.

-------
## User Stories
```
MVP

  As a new user
  so that I can save my personal details
  I want to be able to sign up to MakersBnB.

  As a user
  so that I can return at a later date
  I want to be able to log in to Makers BnB.

  As a property owner
  so that I can list a property available for rent
  I want to be able to add its name, description and nightly cost

  As a holiday-maker
  so that I can book a stay
  I want to be able to see all available spaces to rent.

Additional Features

  As a property owner
  so that I can control when my property is rented out
  I want to specify a fixed time period when my property is available for rent.

  As a holiday-maker
  so that I can choose which property to rent
  I want to see all the dates when a property is available.

  As a holiday-maker
  so that I can stay a night at an available property
  I want to send a booking request to the property owner.

  As a property owner
  so that I can manage renting out my properties
  I want to view all booking requests for my properties.

  As a property owner
  so that I can rent out my properties
  I want to approve or decline booking requests.

  As a property owner
  so that I do not double book my properties
  I want to view all my approved requests.

  As a renter
  So that I can pick an available property
  I want to see which dates a property has already been been booked.

```
-----
## Features:
1. MVP
- user can sign up for MakersBnB.
- user can post a new listing. (CREATE)
- user can view all listings. (READ)
- user can log in and out of MakersBnB
- guest can view all listings
2. Additional Features
- user can specify a properties availability
- user can view when a property is available
- user can make booking requests (with a comment)
- user can view booking requests for their properties
- user can approve or decline booking requests
- user cannot approve a request for a date already booked
- user can view approved bookings
- user cannot request a booking on a date a property is already booked
- guest access is limited to viewing listings
- user must correctly enter their password twice on sign up
-----

### Views
- Homepage: log in & Sign up / guest
- Listings
- new Listing
- new booking request
- bookings
- my stays

------
### Domain Relationships
- ONE MakersBnB has MANY Users  
| MakersBnB |-----≡| Users |  

- ONE User has MANY Listings  
| User |-----≡| Listings |  

- ONE Listing has MANY BookingRequests   
| Listing |-----≡| BookingRequests |

- ONE Listing has MANY ApprovedBookings  
| Listing |-----≡| ApprovedBookings |
------

### Class Responsibility Collaborator (CRC) Models

TABLE: Users  
  | id | forename | surname | email | username | password (encrypted) |     
  has n: listings, bookingrequests, Approvedrequests

TABLE: Listings  
| id |  name  | description | cost | user_id |  date_from | date_to |   
  belongs to: user  
  has n: bookingrequests, Approvedrequests

TABLE: Bookingrequests  
  | id | requested_date | listing_id | user_id | message |  
  belongs to: listing, user

TABLE: Bookings / Approvedrequests   
  | id | listing_id | user_id | date |  
  belongs to: listing, user   

------
 ## Technologies used:
- Postgress
- DataMapper
- Bcrypt
- Sinatra
- Json
- RSpec
- Capybara

------
## Project Setup:

1. Git clone this repository.

2. Ensure __postgresql__ is installed:  
  brew install postgresql

3. run both terminal commands:  
  CREATE DATABASE MakersBnB_development  
  CREATE DATABASE MakersBnB_test

4. Install all gem dependencies by running terminal command:   
  bundle install

5. From the MakersBnB directory; run terminal command:  
  rackup

6. View the website by opening a Chrome browser and enter:   
  http://localhost:9292

7. View development database
  - TablePlus (optional, Graphic User Interface to view development database)  
     https://tableplus.com/  

  - Or use terminal command: psql  
      - Select database: \C MakersBnB_development;
      - view all tables: \dt;
      - view a table: SELECT * FROM table_name;
      
8. enter this command into the terminal:  
  source ./sendgrid.env

9. Enjoy!

------
### Authors
- Nathan Hynes: NathanHynes
- Josh Davies: JoshDavies
- Sid Mason-Malik: smasonmalik
- Nabille Helal: NabilleH
