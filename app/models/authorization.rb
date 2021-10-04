class Authorization < ApplicationRecord
  # принадлежность
  belonds_to :user
end
