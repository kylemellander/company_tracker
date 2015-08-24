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

get ("/employees/:id/edit") do
  id = params.fetch("id").to_i
  @employee = Employee.find(id)
  erb(:edit_employee)
end

patch ('/employees/:id') do
  id = params.fetch("id").to_i
  f_name = params.fetch("f_name")
  l_name = params.fetch("l_name")
  division_id = params.fetch("division_id").to_i
  Employee.find(id).update({f_name: f_name, l_name: l_name, division_id: division_id})
  @division = Division.find(division_id)
  erb(:division_details)
end

delete ('/divisions/:division_id/employees/:id') do
  id = params.fetch("id").to_i
  division_id = params.fetch("division_id").to_i
  Employee.find(id).destroy()
  @division = Division.find(division_id)
  erb(:division_details)
end

get ('/projects') do
  @projects = Project.all()
  erb(:projects)
end

post ('/projects') do
  name = params.fetch("name")
  Project.create(name: name)
  @projects = Project.all()
  erb(:projects)
end

get ('/projects/:id') do
  id = params.fetch('id').to_i
  @project = Project.find(id)
  erb(:project_display)
end

delete ('/projects/:id') do
  id = params.fetch("id").to_i
  Project.find(id).destroy
  @projects = Project.all()
  erb(:projects)
end

get ('/projects/:id/edit') do
  id = params.fetch("id").to_i
  @project = Project.find(id)
  erb(:project_display)
end

post ('/projects/:project_id/employees') do
  project_id = params.fetch("project_id").to_i
  employee_id = params.fetch("employee_id").to_i
  f_name = params.fetch("f_name")
  l_name = params.fetch("l_name")
  if employee_id == 0
    Employee.create({f_name: f_name, l_name: l_name, project_id: project_id})
  else
    Employee.find(employee_id).update(project_id: project_id)
  end
  @project = Project.find(project_id)
  erb(:project_display)
end
