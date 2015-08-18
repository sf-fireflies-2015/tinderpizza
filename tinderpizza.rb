require 'sinatra'
require "sinatra/activerecord"

set :database, {adapter: "sqlite3", database: "db/tinderpizza.sqlite3"}

autoload :Pizza, settings.root + '/models/pizza'

Dir[settings.root + '/controllers/*.rb'].each {|file| require file }

get '/' do
  @pizzas = ['pepperoni','margherita','mushroom and garlic']
  erb :home
end

get '/about_us' do
  erb :about_us
end
