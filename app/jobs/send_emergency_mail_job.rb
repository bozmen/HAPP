class SendEmergencyMailJob < ActiveJob::Base
  queue_as :default

  def perform(user, patient)
   	UserMailer.emergency_email(user, patient).deliver_now	
  end
end
