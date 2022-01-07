# Binance Demo Project

#### Running with Docker Compose


Simply run:
```
docker-compose up
```

Then open http://localhost:3000

#### Running without Docker Compose

You'll need the following installed before run successfully:

* Ruby 3.0 or higher
* bundler - `gem install bundler`
* Raills 6.1.4.4 - `gem install rails -v 6.1.4.4`
* PostgreSQL - `brew install postgresql`
* Yarn - `brew install yarn` or [Install Yarn](https://yarnpkg.com/en/docs/install)

Then run:
```
bundle install
```
```
yarn install
```
```
rails db:create db:migrate
```
```
rails server
```
