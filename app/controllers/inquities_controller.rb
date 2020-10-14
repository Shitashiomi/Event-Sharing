class InquitiesController < ApplicationController

	def new
	  @inquity = Inquity.new
	end

	def create
      @inquity = Inquity.new(inquity_params)
      if @inquity.save
      	InquityMailer.inquity_mail(@inquity).deliver
      	redirect_to new_inquity_path
      	flash[:notice] = "お問い合わせが完了しました"
      else
      	redirect_to new_inquity_path
      	flash[:notice] = "お問い合わせに失敗しました"
	  end
	end

	private

	def inquity_params
		params.require(:inquity).permit(:inquity_name, :message)
	end

end
