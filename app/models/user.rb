class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :articles, dependent: :destroy
  has_many :books, dependent: :destroy
  attachment :profile_image, destroy: false
  validates :introduction, length: { maximum: 50 }

  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true

  def books
   return Book.where(user_id: self.id)
  end

end

