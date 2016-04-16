class DrugPrescription < ActiveRecord::Base
	belongs_to :patient
end
