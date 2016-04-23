class DoseAdvisor
	def DoseAdvisor.advise(patient, given_date = nil)
		if(patient.inr_records.empty?)
			return "Patient has to enter an INR record for start of the therapy."
		end
		inr = patient.inr_records.order(:date).last.inr_value
		date = patient.inr_records.order(:date).last.date
		start_date = patient.inr_records.order(:date).first.date
		day = (date - patient.inr_records.order(:date).first.date).to_i + 1
		if(day <= 7)
			if day < 3
				return "Recommended dosage for #{date + 1} is #{patient.initial_dose}mg"
			elsif day == 3
				if inr < 1.5
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1}mg - #{patient.initial_dose * 1.5}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg"
					end
				elsif inr < 1.9
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose}mg"
					end
				elsif inr < 2.5
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg - #{patient.initial_dose}mg "
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose}mg"
					end
				elsif inr <= 3.0
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg - #{patient.initial_dose}mg "
					end
				elsif inr > 3
					if patient.desired_inr == "2.0-3.0"
						return "Holding dose is recommended"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg"
					end
				end
			elsif day == 4
				if inr < 1.5
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose * 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					end
				elsif inr < 1.9
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose}mg - #{patient.initial_dose * 1.5}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose * 2}mg"
					end
				elsif inr < 2.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				elsif inr < 3.0
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.75}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				elsif inr < 3.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Holding dose is recommended"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				else
					return "Holding dose is recommended"
				end
			elsif day == 5
				if inr < 1.5
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2.5}mg"
					end
				elsif inr < 1.9
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					end
				elsif inr < 2.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}"
					end
				elsif inr < 3.0
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.75}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				elsif inr < 3.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				else
					if patient.desired_inr == "2.0-3.0"
						return "Holding dose is recommended"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg"
					end
				end
			elsif day == 6
				if inr < 1.5
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2.5}mg"
					end
				elsif inr < 1.9
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					end
				elsif inr < 2.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}"
					end
				elsif inr < 3.0
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					end
				elsif inr < 3.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.75}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				else
					if patient.desired_inr == "2.0-3.0"
						return "Holding dose is recommended"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.75}mg"
					end
				end
			elsif day == 7
				if inr < 2
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 2.5}mg"
					end
				elsif inr < 2.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose * 2.0}"
					end
				elsif inr < 3.0
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					end
				elsif inr < 3.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.8}mg - #{patient.initial_dose * 0.9}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				else
					if patient.desired_inr == "2.0-3.0"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.8}mg"
					elsif patient.desired_inr == "2.5-3.5"
						return "Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.8}mg - #{patient.initial_dose * 0.9}mg"
					end
				end
			end
		else
			week = day/7
			week_start = start_date + ( 7 * week )
			week_end   = week_start + 6
			last_dose  = patient.drug_prescriptions.order(:date).last.dosage
			if patient.desired_inr == "2.0-3.0"
				if inr < 1.5
					return "Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg - #{last_dose * 1.2}mg"
				elsif inr < 1.9
					return "Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg - #{last_dose * 1.15}mg"
				elsif inr < 3.3
					return "Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose}mg"
				elsif inr < 4.0
					return "Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.95}mg - #{last_dose * 0.85}mg"
				elsif inr < 5.0
					return "We recommend to hold 1-2 doses and recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.9}mg - #{patient.initial_dose * 0.8}mg"
				elsif inr <= 9.0 
					return "We recommend to hold 3 doses and recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.85}mg - #{patient.initial_dose * 0.8}mg"
				elsif inr > 9
					# restart
				end
			elsif patient.desired_inr == "2.5-3.5"
				if inr < 2.0
					return "Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg - #{last_dose * 1.2}mg"
				elsif inr < 2.4
					return "Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg - #{last_dose * 1.15}mg"
				elsif inr < 3.7
					return "Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg"
				elsif inr < 4.0
					return "Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.95}mg - #{last_dose * 0.85}mg"
				elsif inr < 5.9
					return "We recommend to hold 1-2 doses and recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.9}mg - #{patient.initial_dose * 0.8}mg"
				elsif inr <= 9.0 
					return "We recommend to hold 2 doses and recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.85}mg - #{patient.initial_dose * 0.8}mg"
				elsif inr > 9
					# restart
				end
			end
		end
	end
end
