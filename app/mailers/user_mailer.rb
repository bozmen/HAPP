class UserMailer < ApplicationMailer
	default from: 'no-reply@happ.com'

	def emergency_email(user, patient)
		@user = user
		@message = message
		@patient = patient
		mail(to: user.email, subject: "There is an emergency")
	end
end
