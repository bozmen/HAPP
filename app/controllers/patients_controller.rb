class PatientsController < ApplicationController
	include SessionsHelper

	def show
		@inr = InrRecord.new
		@inr_records = current_user.inr_records
	end

	def new
		@patient = Patient.new
	end

	def create
		@patient = Patient.new(signup_params)
		if @patient.save
			redirect_to @patient
		else
			flash[:danger] = "Account could not be created."
			render 'new'
		end
	end

	def init
		@patient = Patient.find(params[:patient_id])
	end

	def set_init
		@patient = Patient.find(params[:patient_id])
		if @patient.update_attributes(init_params)
			# success flash
			flash[:success] = "Patient has successfully initiated." 
			redirect_to monitor_patient_path(current_user, @patient)
		else
			# fail flash
			flash[:danger] = "Patient could not be initiated."
			redirect_to init_patient_path(current_user, @patient)
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
			flash[:success] = "Your profile has been updated successfully."
	    	redirect_to edit_patient_path
	    else 
	    	flash[:danger]  = "Your profile could not be updated."
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

	private
	def init_params
		params.require(:patient).permit(:risk, :desired_inr, :initial_dose)
	end
end
