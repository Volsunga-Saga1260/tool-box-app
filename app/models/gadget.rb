class Gadget < ApplicationRecord
  #アソシエーション
  belongs_to :user
  attachment :image
  
  #バリデーション
  validates :name, presence: true
  validates :text, presence: true, length: {maximum: 200}
end
