# URLockBox

URLockBox is an app for storing links to read for later. See this app in production here [https://shrouded-harbor-42091.herokuapp.com/](https://shrouded-harbor-42091.herokuapp.com/)

## Setup

This app uses ruby version 2.3.1,  Rails 5.0.0.1, and a Postgres database

This app uses RabbitMQ for sending data. To configure your own queue, update the settings in `app/services/bunny_service.rb`

### Installation

 - clone down this repo `git clone git@github.com:epintozzi/temp-mid-mod-1.git`
 - `cd temp-mid-mod-1`
 - `bundle install`
 - `rake db:create db:migrate`
 - to run locally, `rails s` and visit http://localhost:3000

### Testing

- Testing is done with Rspec, capybara, and phantomjs
- Run `rspec` in your terminal to run the test suite

To set it up you will just need to run `npm install phantomjs -g`. Everything else will be installed with Bundle.

## Using the app

To use the app, create an account via the login link. Once you have an account you can start storing link by using the form on the index page. Add a valid URL and a title, and all your links will appear on a list below the form. They can be filtered by test or by read/unread status.
