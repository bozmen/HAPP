class PrescriptionCalendarController < ApplicationController
	def edit
		@patient = Patient.find(params[:patient_id])
		@drug_prescriptions = @patient.drug_prescriptions
		@date = params[:month] ? Date.parse(params[:month].gsub('-', '/')) : Date.today
		@drug = DrugPrescription.new
	end
end
