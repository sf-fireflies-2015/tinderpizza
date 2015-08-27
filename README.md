# Tinder Pizza Sinatra Demo

```
bundle exec ruby tinderpizza.rb 
```

## First Lecture

* What is ``rack``?
* We're using ``sinatra``
* ``bundle init``
* What's in the ``Gemfile``
* ``bundle install`` 
* Blocks must return a string
* Default status code ``200`` and ``content type text/html``
* ``bundle exec ruby tinderpizza.rb``
* ``views`` folder
* ``views/layout.erb``

## Second Lecture Prep
This is slightly different than the Sinatra Skeleton App so you can compare. I'm using ``sinatra-activerecord`` gem to save me some steps. Note; the ``rake db:create_migration`` task is different from your code. Because I'm using ``require "sinatra/activerecord/rake"`` in the ``Rakefile`` instead of writing tasks by hand.

* Add gems
    - ``gem "sinatra-activerecord"``
    - ``gem "sqlite3"`` - don't need postgres for demo
    - ``gem "rake"``
    - 
* Add ``models`` directory
* Add ``models/pizza.rb`` 

```
class Pizza < ActiveRecord::Base
end
```

* ``autoload :Pizza, settings.root + '/models/pizza'``
* Add ``db`` directory
* Added ``Rakefile`` for db tasks
   - and ``rake console`` (handy!)
* Added migration ``rake db:create_migration NAME=create_pizzas``
* Added [Validations](http://guides.rubyonrails.org/active_record_validations.html)
* Added ``db/seeds.rb`` so ``rake db:seed`` works
* Added footer and nav to layout
* Added static ``/about_us`` route
* Added ``controllers/pizza_controller.rb``

# Nested Routes
* Toppings Belong to Pizzas
* ``controlers/topping_controller.rb``
* ``views/toppings``

# Secret Random Keys
* ``models/pizza.rb`` - ``before_create``
* ``db/migrate/XXX_add_secret_key_to_pizzas.rb``

# 2.1.3.A Controller Testing
* [RSpec to test Sinatra](http://recipes.sinatrarb.com/p/testing/rspec)
* Need to support different databases for testing and development
  * Use ``RACK_ENV``
  * Look at the ``set :database`` line in ``tinderpizza.rb``
  * ``RACK_ENV=test rake db:create``
  * ``RACK_ENV=test rake db:migrate``
* Create specs in folders underneath ``./spec`` folder
* ``bundle exec rspec``

# 2.2.3.P Ajax Prep
* [Use a partial to render each pizza](http://www.sinatrarb.com/faq.html#partials)
* Use a partial for the pizza form
* Use helper to format prices

# 2.2.3.P Ajax Lecture
* What is AJAX?
* [8 Ball Example](https://github.com/stujo/javascript-sinatra-ajax-8ball)
* How do I use AJAX to post a form?
* [Calculator Example](https://github.com/stujo/javascript-sinatra-ajax-calculator)
* Tinder Pizza Add Pizza via Ajax



