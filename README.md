# Ajackus RoR
## Dependencies
* Ruby version : 3.0.0
* Rails Version : 6.1.1
## Configuration
```gem install bundler && bundle install```
## Setup and Start the Applicaton
### Database Setup
```rake db:create && rake db:migrate```
### Run the rails server and browse http://localhost:3000
```rails s```
### Start sidekiq
```sidekiq```
## Test Environment Setup
### Test Database Setup
```RAILS_ENV=test rake db:create && RAILS_ENV=test rake db:migrate```
### Run the Test Suit
```rspec```
