class Comment < ApplicationRecord
  validates :user_name, presence:true
  validates :comment, presence:true

  belongs_to :concert, counter_cache:true
end
