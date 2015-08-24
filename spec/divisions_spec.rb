require ('spec_helper')

describe(Division) do
  it('Verifies Active Record set up properly') do
    division = Division.create({:name => "Party Division"})
    expect(Division.all()).to(eq([division]))
  end
end
