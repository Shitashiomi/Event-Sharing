class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user| # ゲストユーザーのemailを基準に取り出す、
        user.name = "wawawa"
        user.password = SecureRandom.urlsafe_base64　# SecureRandomでランダムにパスワードを設定
      end
  end

  attachment :profile_image
  has_many :events, dependent: :destroy
  has_many :event_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true

end
