class DoctorSessionController < ApplicationController
	include SessionsHelper
	before_action :require_logout, only: :new
	def new
		if logged_in?
			redirect_to current_user
		else
			render 'new'
		end
	end
end
