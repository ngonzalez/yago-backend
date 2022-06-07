# yago-backend

* Ruby version
`3.0.4`

* System dependencies
`bundler 2.3.10`
`PostgreSQL 14.3`

* Configuration
```bash
bundle install
```

Edit `.env` file
`cp .env.sample .env`

* Database creation
```bash
bundle exec rails db:create
```

* Database initialization
```bash
bundle exec rails db:migrate
```

* Import NACE-BEL codes
```bash
bundle exec rake data:import_nace_bel_codes
```

* How to run the test suite
```bash
bundle exec rspec
```
