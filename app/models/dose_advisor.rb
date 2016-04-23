class DoseAdvisor
	def advise(patient, given_date = nil)
		inr = patient.inr_records.order(:date).last
		date = given_date || inr.date
		start_date = patient.inr_records.order(:date).first.date
		day = date - patient.inr_records.order(:date).first
		if(patient.therapy_state == "daily")
			if day == 3
				if inr < 1.5
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1}mg - #{patient.initial_dose * 1.5}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg"
					end
				elsif inr < 1.9
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose}mg"
					end
				elsif inr < 2.5
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg - #{patient.initial_dose}mg "
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose}mg"
					end
				elsif inr < 3.0
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg - #{patient.initial_dose}mg "
					end
				elsif inr > 3
					if patient.desired_inr == "2.0-3.0"
						"Holding dose is recommended"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg"
					end
				end
			elsif day == 4
				if inr < 1.5
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose * 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					end
				elsif inr < 1.9
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose}mg - #{patient.initial_dose * 1.5}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose * 2}mg"
					end
				elsif inr < 2.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				elsif inr < 3.0
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.75}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				elsif inr < 3.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Holding dose is recommended"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				else
					"Holding dose is recommended"
				end
			elsif day == 5
				if inr < 1.5
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2.5}mg"
					end
				elsif inr < 1.9
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					end
				elsif inr < 2.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}"
					end
				elsif inr < 3.0
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.75}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				elsif inr < 3.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				else
					if patient.desired_inr == "2.0-3.0"
						"Holding dose is recommended"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.5}mg"
					end
				end
			elsif day == 6
				if inr < 1.5
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2.5}mg"
					end
				elsif inr < 1.9
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					end
				elsif inr < 2.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}"
					end
				elsif inr < 3.0
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					end
				elsif inr < 3.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.75}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				else
					if patient.desired_inr == "2.0-3.0"
						"Holding dose is recommended"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.75}mg"
					end
				end
			elsif day == 7
				if inr < 2
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 2.5}mg"
					end
				elsif inr < 2.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 1.5}mg - #{patient.initial_dose * 2.0}"
					end
				elsif inr < 3.0
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}mg"
					end
				elsif inr < 3.5
					dp  = patient.drug_prescriptions.order(:date).last
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.8}mg - #{patient.initial_dose * 0.9}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{dp.dosage}"
					end
				else
					if patient.desired_inr == "2.0-3.0"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.8}mg"
					elsif patient.desired_inr == "2.5-3.5"
						"Recommended dosage for #{date + 1} is #{patient.initial_dose * 0.8}mg - #{patient.initial_dose * 0.9}mg"
					end
				end
			end
		elsif (patient.therapy_state == "weekly")
			week = day/7
			week_start = start_date + ( 7 * week )
			week_end   = week_start + 6
			last_dose  = patient.drug_prescriptions.order(:date).last.dosage
			if patient.desired_inr == "2.0-3.0"
				if inr < 1.5
					"Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg - #{last_dose * 1.2}mg"
				elsif inr < 1.9
					"Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg - #{last_dose * 1.15}mg"
				elsif inr < 3.3
					"Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose}mg"
				elsif inr < 4.0
					"Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.95}mg - #{last_dose * 0.85}mg"
				elsif inr < 5.0
					"We recommend to hold 1-2 doses and recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.9}mg - #{patient.initial_dose * 0.8}mg"
				elsif inr < 9.0 
					"We recommend to hold 3 doses and recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.85}mg - #{patient.initial_dose * 0.8}mg"
				elsif inr > 9
					# restart
				end
			elsif patient.desired_inr == "2.5-3.5"
				if inr < 2.0
					"Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg - #{last_dose * 1.2}mg"
				elsif inr < 2.4
					"Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg - #{last_dose * 1.15}mg"
				elsif inr < 3.7
					"Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 1.1}mg"
				elsif inr < 4.0
					"Recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.95}mg - #{last_dose * 0.85}mg"
				elsif inr < 5.9
					"We recommend to hold 1-2 doses and recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.9}mg - #{patient.initial_dose * 0.8}mg"
				elsif inr < 9.0 
					"We recommend to hold 2 doses and recommended dosage for the remaining of #{week_start} - #{week_end} week is #{last_dose * 0.85}mg - #{patient.initial_dose * 0.8}mg"
				elsif inr > 9
					# restart
				end
			end
		end
	end
end