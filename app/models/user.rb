class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  has_many :fridge_users, dependent: :destroy
  has_many :fridges, through: :fridge_users
  has_many :bookmarks
end
