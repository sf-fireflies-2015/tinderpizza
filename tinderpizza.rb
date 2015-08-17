require 'sinatra'

get '/' do
  @pizzas = ['pepperoni','margherita','mushroom and garlic']
  erb :home
end

