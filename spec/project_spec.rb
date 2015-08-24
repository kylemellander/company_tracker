require('spec_helper')

describe(Project) do

  before do
    @division = Division.create({:name => "Party Division"})
    @employee = Employee.create({f_name: "Ryan", l_name: "Heupler", division_id: @division.id})
  end


  it('tells if a project is finished') do
    not_done_project = Project.create({:name => "Fix the baby", :done => false})
    not_done_project2 = Project.create({:name => "Speak to the baby", :done => false})
    expect(Project.not_done()).to eq([not_done_project, not_done_project2])
  end
end
