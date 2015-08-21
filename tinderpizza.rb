require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/flash'

begin
  require "better_errors"

  configure :development do
    use BetterErrors::Middleware
    BetterErrors.application_root = __dir__
  end

rescue LoadError
  puts "Skipping better_errors in production"
end

autoload :Topping, settings.root + '/models/topping'
autoload :Pizza, settings.root + '/models/pizza'
autoload :User, settings.root + '/models/user'

Dir[settings.root + '/controllers/*.rb'].each {|file| require file }
Dir[settings.root + '/helpers/*.rb'].each {|file| require file }

# Enable Sessions
enable :sessions
set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'





get '/' do
  p session
  session[:test] = 'hello'
  @pizzas = Pizza.all.order(:price_cents => :asc).limit(2)
  erb :home
end

get '/about_us' do
  p session
  session[:test] = 'aboutus'
  erb :about_us
end
