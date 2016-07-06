class Project < ApplicationRecord   # base class of all models  ActiveRecord::Base

  has_many :time_entries

  



end
