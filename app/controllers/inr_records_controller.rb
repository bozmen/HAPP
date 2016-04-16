class InrRecordsController < ApplicationController
	include SessionsHelper

	def create
		patient = Patient.find(params[:id])
		inr = InrRecord.new(create_params)
		if inr.save
			# başarılı oldu diye flash bas
			patient.inr_records << inr
			redirect_to current_user
		else
			# başarısız oldu diye flash bas
			redirect_to current_user
		end
	end

	def destroy
	end

	private
	def create_params
		params.require(:inr_record).permit(:inr_value, :date)
	end
end
