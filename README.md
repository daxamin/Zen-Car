# README

Preconfigured credentials [PLEASE DON'T CHANGE THESE CREDENTIALS. If you want to test update password, please change them back to these preconfigured password]

Superadmin-
username: superaddmin@abc.com
password: superadmin

Admin-
username: admin@admin.com
password: password

Signup:










This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version - 2.4.1p111

* Rails version - 5.1.4

* System dependencies - run 'bundle install' to install all the dependencies

* Configuration

* Database creation - using Postgre sql

* Database initialization - an admin has to be created using rails console on the server

* How to run the test suite - Run the following commands - 
                            rails db:test:prepare
                            rails test test/unit/car_test.rb
                            

* Services (job queues, cache servers, search engines, etc.) - It uses rails cron jobs to change the status of Reserved Car to Available when not checked out without half an hour of the said 'check out time'

* Deployment instructions - Code is deployed to Heroku server from the Master branch of GIT

*********Assumptions and different corner scenarios*******************
* To view all cars click search without adding any filters
* If an Admin deletes a User/Car with existing Reservations, all the existing reservations are deleted along with the required User/Car
* Admin can create a reservation on behalf of customer by searching a car, clickling Reserve and entering customer's valid email id
* Admin can checkout/return a car on behalf of customer by clicking show next to the customer who has Reservations

