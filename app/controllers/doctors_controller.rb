class DoctorsController < ApplicationController
	before_action :require_login, only: [:show, :update, :edit, :add_patient, :delete_patient, :monitor_patient]
	before_action :require_init, only: :monitor_patient
	before_action :require_doctor_login, only: [:show, :edit, :update, :add_patient, :delete_patient, :monitor_patient]
	before_action :require_patient_ownership, only: [:delete_patient, :monitor_patient]


	def show
	end

	# GET 'doctors/new'
	def new
		@doctor = Doctor.new
	end

	# POST 'doctors'
	def create
		@doctor = Doctor.new(signup_params)
		if @doctor.save 
			log_in @doctor, "doctor"
			redirect_to @doctor
		else
			flash[:danger] = "Account could not be created."
			render 'new'
		end
	end

	# GET 'doctors/:id/edit'
	def edit
		@doctor = current_user
	end

	def destroy
	end

	# PATCH 'doctors/:id'
	def update
		@doctor = current_user
		if  @doctor.update_attributes(update_params)
			flash[:success] = "Your profile has been updated successfully."
	    	redirect_to edit_doctor_path
	    else
	    	flash[:danger] = "Your profile could not be updated."
	    	redirect_to edit_doctor_path
	    end
	end

	# POST 'doctors/:id/add_patient'
	def add_patient
		patient = Patient.find_by_email(params[:patient][:email])
		if patient
			if patient.doctor
				# zaten bir doktoru var diye flash ver
				flash[:danger] = "This patient is already assigned to a doctor."
				redirect_to current_user
			else
				flash[:success] = "Patient is assigned to you successfully."
				patient.doctor = current_user
				patient.save
				redirect_to current_user
			end
		else
			# böyle bir hasta yok diye 
			redirect_to current_user
		end
	end

	def delete_patient
		patient = Patient.find(params[:patient_id])
		@doctor = current_user
		@doctor.patients.delete(patient)
		redirect_to current_user
	end

	# GET 'doctors/:id/monitor_patient/:patient_id'
	def monitor_patient
		@patient = Patient.find(params[:patient_id])
		@drug_prescriptions = @patient.drug_prescriptions
		@date = params[:month] ? Date.parse(params[:month].gsub('-', '/')) : Date.today
		@drug = DrugPrescription.new
	end

	private
	def signup_params
		params.require(:doctor).permit(:name, :surname, :email, :password, :password_confirmation)
	end

	private
	def update_params
		params.require(:doctor).permit(:name, :surname, :email, :birthday, :password, :password_confirmation)
	end
end
