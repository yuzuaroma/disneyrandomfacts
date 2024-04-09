class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :yuzus
  has_many :likes, dependent: :destroy
  has_many :liked_yuzus, through: :likes, source: :yuzu
  has_many :comments, dependent: :destroy
  def already_liked?(yuzu)
    self.likes.exists?(yuzu_id: yuzu.id)
  end
end
