class Hair < ApplicationRecord
  belongs_to :user
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader
  mount_uploader :image3, ImageUploader
  mount_uploader :image4, ImageUploader


  # validates :day, presence: true
  # validates :money, numericality: { only_integer: true }
  # validates :menu, presence: true
  # validates :memo1, presence: true
  # validates :memo2, presence: true

  validate :hair_error_message

  def hair_error_message

    if day.blank?
      errors[:base] << '来店日を入力してください'
    end

    if money.blank?
      errors[:base] << 'お会計金額を入力してください'
    end

    if menu.blank?
      errors[:base] << 'メニュー&薬剤情報を入力してください'
    end

    if memo1.blank?
      errors[:base] << 'コメントを入力してください'
    end

    if memo2.blank?
      errors[:base] << 'その他備考を入力してください'
    end
  end
end