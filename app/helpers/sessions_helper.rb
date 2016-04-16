module SessionsHelper

	def log_in(user, type)
		session[:user_id] = user.id
		session[:user_type] = type
		@current_user = user
	end

	def log_out
		session[:user_id] = nil
		session[:user_type] = nil
		@current_user = nil
	end
	
	def current_user
		if (user_id = session[:user_id])
			if(session[:user_type] == "patient")
				@current_user ||= Patient.find_by(id: user_id)
			elsif(session[:user_type] == "doctor")
				@current_user ||= Doctor.find_by(id: user_id)
			end
		else
			@current_user = nil
		end
	end

	def logged_in?
		!current_user.nil?
	end
end
