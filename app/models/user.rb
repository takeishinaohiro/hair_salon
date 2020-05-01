class User < ApplicationRecord
  has_many :hairs,dependent: :destroy

  validate :user_error_message

  def user_error_message

    if name1.blank?
      errors[:base] << 'お名前を漢字で入力してください'
    end

    if name2.blank?
      errors[:base] << 'お名前を漢字で入力してください'
    end

    if read_name1.blank?
      errors[:base] << 'お名前をカナ文字で入力してください'
    end

    if read_name2.blank?
      errors[:base] << 'お名前をカナ文字で入力してください'
    end

    if tel.blank?
      errors[:base] << '電話番号を入力してください'
    end

    if birthday.blank?
      errors[:base] << '生年月日を入力してください'
    end

  end

  def self.search(search)
    return User.all unless search
    User.where('name1 LIKE(?)', "%#{search}%")
  end
end
