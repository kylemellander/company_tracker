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

post ('/divisions') do
  name = params.fetch('name')
  Division.create({:name => name})
  erb(:divisions)
end

get ('/divisions/:id/edit') do
  id = params.fetch('id').to_i
  @division = Division.find(id)
  erb(:edit_division)
end

patch ('/divisions/:id') do
  id = params.fetch('id').to_i
  name = params.fetch('name')
  Division.find(id).update({:name => name})
  erb(:divisions)
end
