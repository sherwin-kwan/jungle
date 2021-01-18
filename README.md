# Yonago

A restaurant takeout application built with Rails. Lots of delicious food you can order online! The application is server-side rendered, however there is limited use of front-end JS libraries within the Rails views.

The name Yonago is a tribute to Matz (Matsumoto Yukihiro), the developer who created the Ruby language in 1995, who was a native of Yonago on the western coast of Japan.

[Here](https://yonago.herokuapp.com) is the deployed version if you just want to test out the app.

Warning: Expect it to take 5-10 seconds to load when visiting the link for the first time.
After that, the website should run normally. This is because this is hosted on the
free tier of Heroku, which unloads apps when they haven't been visited in a while to save resources.

## Technical Information

It is forked from @lighthouse-labs/jungle, a Ruby on Rails e-commerce boilerplate. To summarize changes since the fork:

* Rails was updated from 4.2 to 6.1, and certain pieces of code were re-written accordingly (i.e. there were breaking changes to migrations and currency handling)
* Webpacker is now used to serve assets such as images and scripts instead of the traditional Rails asset pipeline (which would use Sprockets). This allows for easier integration with JavaScript libraries on the front end.
  * Warning: If you try to build this code using the asset pipeline, it will fail as the `assets:precompile` Rake task has been monkey-patched over to avoid a bug when deploying to Heroku. Running `assets:precompile` will instead call the Rake task `webpacker:compile`.
* The homepage now allows you to browse through the menu, add dishes to your order, and see your total price update asynchronously. This SPA-like behaviour uses React components added using the react-rails gem.
* The Poltergeist driver (for Capybara, which runs end-to-end RSpec tests) has been replaced with Selenium, as the former is no longer actively maintained. Tests are now run using a Gecko driver instead of a headless browser (i.e. an instance of Firefox will open to run the Capybara test)
* Bootstrap has been removed and replaced with custom CSS classes.
* An admin interface was added so admins can create new dishes
* There is now a page where a user can view their past orders.
  * In order to facilitate this, the database schema was changed slightly.
* User authentication (login/registration) was added. 

!["Homepage"](/public/homepage_v2.png)

## Stack

* Ruby on Rails
* ReactJS
* SCSS
* PostgreSQL
* Stripe for payments

## Other Notable Gems

* Carrierwave - used to upload photos
* Bcrypt - for authentication
* Turbolinks - to minimize full page reloads when navigating between pages on the website
* Capybara + Selenium driver + Rspec: testing

## Dependencies

* Ruby 3.0
* Rails 6.1
* Bundler
* Webpacker
* PostgreSQL 9.x or higher
* Stripe

## Setup

* Ensure you have the correct version of Ruby (3.0) and Rails (6.1) installed, and that you have access to a Postgres database. 
If you have a different version, you may use rvm, rbenv, asdf, or any other version manager of your choice to install 3.0 alongside your current Ruby, for example:
```bash
rvm install 3.0.0
rvm use 3
```
* Run `bundle install` to install dependencies (If this doesn't work, you may need to run `gem install bundler` first to get Bundler onto your system)
* Next, run `yarn #` to install JavaScript dependencies for the front end. (If this doesn't work, you may need to install Yarn. On most Unix/Linux systems, you should be able to type `sudo apt install yarn` to get Yarn onto your system)
  * Alternatively, you can use `npm` to install the JavaScript dependencies. However, before doing this, it may be a good idea to delete `yarn.lock` so you don't have two lock files from different package managers as this will create a `package-lock.json`.
* Create `config/database.yml` by copying `config/database.example.yml` and entering the correct credentials for your Postgres database
* Create `config/secrets.yml` by copying `config/secrets.example.yml`
* Run `rails db:reset` to create, load and seed db. If this doesn't work, make sure you've already created a database and its name appears in the config file `database.yml`. Failing that, you could also try to first run `rails db:migrate` to run the migrations in order and then `rails db:seed` to seed them.
* Create .env file based on .env.example
* Sign up for a Stripe account
* Put Stripe (test) keys into appropriate .env vars. DO NOT USE LIVE KEYS UNLESS YOU'RE WILLING TO SPEND REAL MONEY TRYING OUT THIS APP.
* Run `rails server -p <PORT NUMBER>` to start the server (if no port is entered, the default is 3000)
* If you are running this over a virtualization service like Vagrant, you may need to run `rails server -b 0.0.0.0 -p <PORT NUMBER>`

## Stripe Integration

Use Credit Card # 4242 4242 4242 4242 with any future expiry date and any 3-digit code to place an order. (This is a standard fake credit card number provided by Stripe)

Warning: DO NOT attempt to test out the app with real credit card numbers and live keys - Stripe takes a cut of each transaction so even if you process a "refund", Stripe still gets some of your money for free!

More information in their docs: <https://stripe.com/docs/testing#cards>
