class DrugPrescriptionsController < ApplicationController
	def create
		patient = Patient.find(params[:patient_id])
		drug = DrugPrescription.new(create_params)
		if drug.save
			# başarılı oldu diye flash bas
			patient.drug_prescriptions << drug
			redirect_to monitor_patient_path(current_user, patient)
		else
			# başarısız oldu diye flash bas
			redirect_to current_user
		end
	end

	def destroy
		drug = DrugPrescription.find(params[:prescription_id])
		patient = drug.patient
		drug.destroy
		redirect_to monitor_patient_path(current_user, patient)
	end

	def update
		@drug_prescription = DrugPrescription.find(params[:prescription_id])
		if  @drug_prescription.update_attributes(update_params)
			# başarılı diye flash at
	    	redirect_to monitor_patient_path(current_user, @drug_prescription.patient)
	    else 
	    	# başarısız diye flash at
	    	redirect_to monitor_patient_path(current_user, @drug_prescription.patient)
	    end
	end

	private
	def create_params
		params.require(:drug_prescription).permit(:date, :dosage)
	end

	private
	def update_params
		params.require(:drug_prescription).permit(:dosage)
	end
end
