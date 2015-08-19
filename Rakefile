require "sinatra/activerecord/rake"

namespace :db do
  task :load_config do
    require "./tinderpizza"
  end
end

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

desc "run irb console"
task :console, :environment do |t, args|
  ENV['RACK_ENV'] = args[:environment] || 'development'

  exec "irb -r ./tinderpizza"
end