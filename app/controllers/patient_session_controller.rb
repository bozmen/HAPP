class PatientSessionController < ApplicationController
	def new
		if logged_in?
			redirect_to current_user
		else
			render 'new'
		end
	end

	def create
    # isim = params[:session][:email]
    # sifre = params[:session][:password]

    email = params[:session][:email].strip.downcase
  	patient = Patient.find_by(email: email)
  	if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		redirect_to user
      flash[:success] = t('session.success', name: user.full_name)
  	else
  		flash[:notice] = t('session.notice')
  		render 'new'
  	end
  end
end
