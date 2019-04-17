# OLIO Articles

This is a simple Ruby app using the [Rails](http://rubyonrails.org) framework.

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org) and [Bundler](http://bundler.io) installed.

```sh
git clone git@github.com:cesidio/olio-articles.git
cd olio-articles
bundle
bundle exec rails db:setup
rails s
```
OLIO articles app should now be running on [localhost:3000](http://localhost:3000/).

In order to run the specs:

```sh
rake
```
