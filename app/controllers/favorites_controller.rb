class FavoritesController < ApplicationController

	def create
      @event = Event.find(params[:event_id])
      favorite = current_user.favorites.build(event_id: params[:event_id])
      favorite.save
	end

	def destroy
		@event = Event.find(params[:event_id])
		favorite = Favorite.find_by(event_id: params[:event_id], user_id: current_user.id)
		favorite.destroy
	end

end
