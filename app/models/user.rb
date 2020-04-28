class User < ApplicationRecord
  has_many :hairs,dependent: :destroy

  def self.search(search)
    return User.all unless search
    User.where('name1 LIKE(?)', "%#{search}%")
  end
end
