class User < ApplicationRecord
  has_many :hairs

  def self.search(search)
    if search
      User.where('name1 LIKE(?)', "%#{search}%")
    else
      User.all
    end
  end
  end

  def self.search(search)
    return User.all unless search
    User.where('name1 LIKE(?)', "%#{search}%")
  end
end
