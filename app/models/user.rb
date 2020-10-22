class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  attachment :profile_image
  has_many :events, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name,
  uniqueness: { case_sensitive: :false },
  length: { minimum: 4, maximum: 20 }
  validates :email, presence: true
  validates :password, presence: true

end
