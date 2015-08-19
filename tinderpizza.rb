require 'sinatra'
require "sinatra/activerecord"
require 'sinatra/flash'
require "better_errors"

configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = __dir__
end

set :database, {adapter: "sqlite3", database: "db/tinderpizza_#{settings.environment}.sqlite3"}

autoload :Topping, settings.root + '/models/topping'
autoload :Pizza, settings.root + '/models/pizza'
autoload :User, settings.root + '/models/user'

Dir[settings.root + '/controllers/*.rb'].each {|file| require file }

# Enable Sessions
enable :sessions
set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'


helpers do

  def auth_logged_in?
    !session[:user_id].nil?
  end

  def auth_login(user)
    session[:user_id] = user.id
  end

  def auth_logout
    session.destroy
  end

  def auth_current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

end



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
