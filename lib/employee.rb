class Employee < ActiveRecord::Base
  belongs_to(:division)
  belongs_to(:project)

  def full_name
    "#{f_name} #{l_name}"
  end
end
