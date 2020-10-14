class Event < ApplicationRecord
	belongs_to :user, optional: true
	attachment :image
    has_many :event_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

    #↓:addressを登録した時にgeocoderが緯度・経度のカラムにも自動的に入れてくれる
    geocoded_by :address
    after_validation :geocode, if: :address_changed?

    #ジャンルのプルダウン項目の設定
	enum genre: {"イベント":0, "お祭り":1, "マルシェ":2, "花火大会":3, "フリーマーケット":4, "フェス":5}

    # 引数で渡されたuser_idがfavoritesテーブル内に存在(exists?)するか調べる
	def favorited_by?(user)
	  if favorites.where(user_id: user.id).exists?
	  	return true
	  else
	  	return false
	  end
	end

	# バリデーションの設定によりエラーの検知
	validates :title, presence: true
	validates :address, presence: true
	validates :description, presence: true

end
