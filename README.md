# Yonago

A restaurant takeout application built with Rails. Lots of delicious food you can order online!

It is forked from @lighthouse-labs/jungle as part of a curriculum to teach Ruby on Rails.

The name Yonago is a tribute to Matz (Matsumoto Yukihiro), the developer who created the Ruby language in 1995, who was a native of Yonago on the western coast of Japan.

[Here](https://yonago.herokuapp.com) is the deployed version if you just want to test out the app.

Warning: Expect it to take 5-10 seconds to load when visiting the link for the first time.
After that, the website should run normally. This is because this is hosted on the
free tier of Heroku, which unloads apps when they haven't been visited in a while to save resources.

!["Homepage"](/public/homepage_v2.png)

## Stack

* Ruby on Rails 
* SCSS
* PostgreSQL

## Testing

* Capybara + Selenium + Rspec

## Dependencies

* Ruby 2.7
* Rails 6.1
* Bundler
* Webpacker
* PostgreSQL 9.x or higher
* Stripe

## Setup

* Ensure you have the correct version of Ruby (2.7) and Rails (6.1) installed, and that you have access to a Postgres database. 
If you have a different version, you may use rvm to install 2.7 alongside your current Ruby:
```bash
rvm install 2.7.0
rvm use 2.7.0
```
* Run `bundle install` to install dependencies (If this doesn't work, you may need to run `gem install bundler` first to get Bundler onto your system)
* Create `config/database.yml` by copying `config/database.example.yml` and entering the correct credentials for your Postgres database
* Create `config/secrets.yml` by copying `config/secrets.example.yml`
* Run `rails db:reset` to create, load and seed db
* Create .env file based on .env.example
* Sign up for a Stripe account
* Put Stripe (test) keys into appropriate .env vars. DO NOT USE LIVE KEYS UNLESS YOU'RE WILLING TO SPEND REAL MONEY TRYING OUT THIS APP.
* You will need PhantomJS in order to run the Capybara test suites. You can install it by either:
  * `npm install` then adding the "phantomjs" subfolder of your node_modules folder to your PATH (so Poltergeist/Capybara can find it)
  * `npm install -g phantomjs`
* Run `bin/rails s -p <PORT NUMBER>` to start the server
* If you are running this over a virtualization service like Vagrant, you may need to run `rails s -b 0.0.0.0 -p <PORT NUMBER>`

## Stripe Integration

Use Credit Card # 4242 4242 4242 4242 with any future expiry date and any 3-digit code to place an order. (This is a standard fake credit card number provided by Stripe)

Warning: DO NOT attempt to test out the app with real credit card numbers and live keys - Stripe takes a cut of each transaction so even if you process a "refund", Stripe still gets some of your money for free!

More information in their docs: <https://stripe.com/docs/testing#cards>
