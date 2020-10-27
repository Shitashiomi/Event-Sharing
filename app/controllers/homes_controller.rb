class HomesController < ApplicationController

	def top
	  @events = Event.all
	end

end
