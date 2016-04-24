class InrRecordsController < ApplicationController
	include SessionsHelper

	def create
		patient = Patient.find(params[:id])
		inr = InrRecord.new(create_params)

		if inr.save
			# başarılı oldu diye flash bas
			patient.inr_records << inr
			if inr.inr_value >= 9.0
				if patient.doctor
					SendEmergencyMailJob.perform_later patient.doctor, patient
				end
			end
			redirect_to current_user
		else
			# başarısız oldu diye flash bas
			redirect_to current_user
		end
	end

	def destroy
		inr = InrRecord.find(params[:inr_id])
		inr.destroy
		redirect_to current_user
	end

	private
	def create_params
		params.require(:inr_record).permit(:inr_value, :date)
	end
end
