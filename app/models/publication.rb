class Publication < ActiveRecord::Base
  belongs_to :user, required: false
end
