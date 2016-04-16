class DoctorSessionController < ApplicationController
	def new
		if logged_in?
			redirect_to current_user
		else
			render 'new'
		end
	end
end
