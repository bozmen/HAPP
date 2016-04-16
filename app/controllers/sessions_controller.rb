class SessionsController < ApplicationController
	include SessionsHelper

	def create
	    email = params[:session][:email].strip.downcase
	    type =  params[:session][:type]
	    if(type == "patient")
	    	user =Patient.find_by(email: email)
	    elsif(type == "doctor")
	    	user = Doctor.find_by(email: email)
	    end
	    if user && user.authenticate(params[:session][:password])
	    	log_in user, type
	    	redirect_to user
	    else
	    	render "#{type}_session/new"
	    end
	end

	def destroy
	    log_out if logged_in?
	    flash[:success] = t('session.successloggedout')
	    redirect_to root_url
  	end
end
