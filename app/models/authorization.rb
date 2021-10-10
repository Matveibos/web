class Authorization < ApplicationRecord
  # принадлежность
  belongs_to :user
end
