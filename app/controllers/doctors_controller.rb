class DoctorsController < ApplicationController
	def show
		@articles = Patient.all
		@date = params[:month] ? Date.parse(params[:month].gsub('-', '/')) : Date.today
	end

	def new
		@doctor = Doctor.new
	end

	def create
		@doctor = Doctor.new(signup_params)
		if @doctor.save
			redirect_to :new_doctor
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
		params.require(:doctor).permit(:name, :surname, :email, :password, :password_confirmation)
	end
end
