class PatientsController < ApplicationController
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
	end

	def destroy
	end

	def update
	end

	private
	def signup_params
		params.require(:patient).permit(:name, :surname, :email, :password, :password_confirmation)
	end
end
