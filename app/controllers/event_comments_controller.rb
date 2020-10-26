class EventCommentsController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		@comment = @event.event_comments.build(event_comment_params)
		@comment.user_id = current_user.id
		@comment.save
		render :index
	end

	def destroy
		@event = Event.find(params[:event_id])
		@comment = EventComment.find(params[:id])
		@comment.destroy
		render :index
	end

	private
	def event_comment_params
		params.require(:event_comment).permit(:comment, :event_id, :user_id)
	end

end
