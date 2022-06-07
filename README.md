# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
`3.0.4`

* System dependencies
`bundler 2.3.10`
`PostgreSQL 14.3`

* Configuration
`bundle install`

* Database creation
Edit `.env` file
`cp .env.sample .env`
`bundle exec rails db:create`

* Database initialization
`bundle exec rails db:migrate`

* Import NACE-BEL codes
`bundle exec rake data:import_nace_bel_codes`

* How to run the test suite
`bundle exec rspec spec/requests/graphql/mutations/*`
