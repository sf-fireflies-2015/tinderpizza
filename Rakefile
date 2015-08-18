require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./tinderpizza"
  end
end


desc "run irb console"
task :console, :environment do |t, args|
  ENV['RACK_ENV'] = args[:environment] || 'development'

  exec "irb -r ./tinderpizza"
end