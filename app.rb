require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'pg'
also_reload 'lib/**/*.rb'
require './lib/project'
require './lib/division'
require './lib/employee'

get ('/') do
  erb(:index)
end

get ('/divisions') do
  erb(:divisions)
end
