class PatientsController < ApplicationController
	include SessionsHelper

	def show
	end

	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new(signup_params)
		if @patient.save
			redirect_to :new_patient
		else
			render 'new'
		end
	end

	def edit
		@patient = current_user
	end

	def destroy
	end

	def update
		@patient = current_user
		if  @patient.update_attributes(update_params)
	    	redirect_to edit_patient_path
	    else 
	    	redirect_to edit_patient_path
	    end
	end

	private
	def signup_params
		params.require(:patient).permit(:name, :surname, :email, :password, :password_confirmation)
	end

	private
	def update_params
		params.require(:patient).permit(:name, :surname, :email, :birthday, :password, :password_confirmation)
	end
end
