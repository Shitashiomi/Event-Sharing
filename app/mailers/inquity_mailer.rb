class InquityMailer < ApplicationMailer

	def inquity_mail(inquity)
		@inquity = inquity
		mail to: 'waffca0417@gmail.com', subject: 'お問い合わせ内容'
	end
end
