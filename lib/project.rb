class Project < ActiveRecord::Base
  has_many(:employees)

  scope(:not_done, -> do
    where({:done => false})
  end)
end
