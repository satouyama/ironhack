class Project < ApplicationRecord   # base class of all models  ActiveRecord::Base

  has_many :time_entries

  validates :name, presence:true, uniqueness:true, length: {maximum:30}, format: { with: /\A[a-zA-Z1-9\s]*\z/ }



end
