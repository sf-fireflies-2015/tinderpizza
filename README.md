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