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

delete ('/divisions/:id') do
  id = params.fetch('id').to_i
  Division.find(id).destroy()
  erb(:divisions)
end

get ('/divisions/:id') do
  id = params.fetch('id').to_i
  @division = Division.find(id)
  erb(:division_details)
end

post ('/divisions/:id/employees') do
  id = params.fetch('id').to_i
  employee_id = params.fetch('employee_id').to_i
  f_name = params.fetch('f_name')
  l_name = params.fetch('l_name')
  if employee_id == 0
    Employee.create({f_name: f_name, l_name: l_name, division_id: id})
  else
    Employee.find(employee_id).update({division_id: id})
  end
  @division = Division.find(id)
  erb(:division_details)
end
