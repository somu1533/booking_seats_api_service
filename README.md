# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version 
    2.7.0p0
* Configuration
    > bundle install
* Database creation
    > rake db:create
* Database initialization
    > rake db:migrate
* How to run the test suite
    - Model validations
        > rspec spec/models/venue_spec.rb
        > rspec spec/models/seat_spec.rb
    - Route Validation
        > rspec spec/routing/venues_routing_spec.rb
        > rspec spec/routing/seats_routing_spec.rb
    - Controller 
        > rspec spec/controllers/venues_controller_spec.rb
        > rspec spec/controllers/seats_controller_spec.rb
* Deployment instructions
    > git pull
    > cd 
    > bundle install
    > rails server
* Manual Testing 
    1) Creating venue with layout 
    > curl -i -X POST -H "Content-Type: application/json" -d '{"name": "venue1", "layout_row": 10, "layout_column": 10}' http://localhost:3000/venues
    2) Get the closure seats for the vanue only done for single seats
    > curl -i -X GET http://localhost:3000/venues/venue1
    3) Book the seat
    > curl -i -X PATCH -H "Content-Type: application/json" -d '{"status": "NOT AVAILABLE"}' http://localhost:3000/venues/venue1/seats/a4
