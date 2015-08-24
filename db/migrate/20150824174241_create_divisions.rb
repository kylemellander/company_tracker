class CreateDivisions < ActiveRecord::Migration
  def change
    create_table(:divisions) do |t|
      t.column(:name, :string)
    end

    create_table(:employees) do |t|
      t.column(:f_name, :string)
      t.column(:l_name, :string)
      t.column(:division_id, :integer)
      t.column(:project_id, :integer)
    end

    create_table(:projects) do |t|
      t.column(:name, :string)
      t.column(:done, :boolean, default: false)
    end
  end
end
