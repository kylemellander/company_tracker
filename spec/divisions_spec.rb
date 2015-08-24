require ('spec_helper')

describe(Division) do
  before do
    @division = Division.create({:name => "Party Division"})
    @employee = Employee.create({f_name: "Ryan", l_name: "Heupler", division_id: @division.id})
  end
  
  it('Verifies Active Record set up properly') do
    expect(Division.all()).to(eq([@division]))
  end

  it("pulls an array of all employees in a division") do
    expect(@division.employees).to eq ([@employee])
  end
end
