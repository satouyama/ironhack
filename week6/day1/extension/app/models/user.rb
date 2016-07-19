class User < ApplicationRecord
  # attr_accessible :name

  has_many :accounts do
    def recent
      p where("accounts.created_at > ?", 10.days.ago)
      p "haha"
    end

  end

end
