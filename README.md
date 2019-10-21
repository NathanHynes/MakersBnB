# MakersBnB

We would like a web application that allows users to list spaces they have available, and to hire spaces for the night.

-------

## User Stories MVP
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

## MVP Model
### Views
- Log in page - homepage
- Sign up page 
- list of available spaces.
- new listing page.

-----

### Features:
- user can post a new listing. (CREATE)
- user can view all listings in reverse chronological order. (READ)
- user can sign up for MakersBnB.

-----

### Domain Relationships
- MakersBnB has MANY Users
|MakersBnB|---≡|Users|  

- User has MANY listings
|user|---≡|listings|  

------

### Class Responsibility Collaborator (CRC) Models

- Table: Listings  
| id |  property  | description | cost | user_id |  
  
- knows about Users.
------

- Table: Users  
| id | email | user_name | first_name | last_name | password (encrypted) |  
 
------

### Class Diagram

|MakersBnB| - > | User | -> | Listing |  
|---------|     |------|    |---------|   

------

 ## Technologies used:
 
------

------
## How to set up the project:

------
