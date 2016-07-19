class Account < ApplicationRecord
  # attr_accessible :kind, :user_id
  belongs_to :user
end
