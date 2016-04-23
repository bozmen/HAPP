class DrugInr
	def DrugInr.generate_array(patient)
		d = patient.drug_prescriptions
		i = patient.inr_records
		results = []
		results << ['Day', 'Dose',  'INR']
		dates = (d.map(&:date) | i.map(&:date))
		dates.each do |date|
			to_add = []
			to_add[0] = date.strftime("%d/%m")
			i_el = i.where(date: date)
			if(!(i_el.empty?))
				to_add[2] = i_el.first.inr_value.to_f
			else
				to_add[2] = nil
			end
			d_el = d.where(date: date)
			if(!(d_el.empty?))
				to_add[1] = d_el.first.dosage.to_f
			else
				to_add[1] = nil
			end
			results << to_add
		end
		return results.to_json.html_safe
	end
end