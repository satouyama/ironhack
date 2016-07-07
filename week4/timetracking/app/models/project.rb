class Project < ApplicationRecord   # base class of all models  ActiveRecord::Base

  has_many :time_entries

  validates :name, presence:true, uniqueness:true, length: {maximum:30}, format: { with: /\A[a-zA-Z1-9\s]*\z/ }







  def self.clean_old

    oldest = Time.now - 1.month
    latest =  Time.now - 1.hour

    old_projects = Project.where("created_at < ? AND created_at > ?",latest, oldest)

    old_projects.destroy_all


  end




end
