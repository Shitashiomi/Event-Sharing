class Event < ApplicationRecord
	belongs_to :user, optional: true
	attachment :image
    has_many :event_comments, dependent: :destroy
    has_many :favorites, dependent: :destroy

	enum genre: {"イベント":0, "お祭り":1, "マルシェ":2, "花火大会":3, "フリーマーケット":4, "フェス":5}

    # 引数で渡されたuser_idがfavoritesテーブル内に存在(exists?)するか調べる
	def favorited_by?(user)
	  favorites.where(user_id: user.id).exists?
	end
end
