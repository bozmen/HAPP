class DoctorsController < ApplicationController
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
			redirect_to :new_doctor
		else
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
	    	redirect_to edit_doctor_path
	    else
	    	redirect_to edit_doctor_path
	    end
	end

	# POST 'doctors/:id/add_patient'
	def add_patient
		patient = Patient.find_by_email(params[:patient][:email])
		if patient
			if patient.doctor
				# zaten bir doktoru var diye flash ver
				redirect_to current_user
			else
				patient.doctor = current_user
				patient.save
				redirect_to current_user
			end
		else
			# böyle bir hasta yok diye flash var
			redirect_to current_user
		end
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
