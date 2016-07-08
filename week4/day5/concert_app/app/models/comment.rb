class Comment < ApplicationRecord
  validates :user_name, presence:true
  validates :comment, presence:true

  belongs_to :concert
end
