class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_init
  	patient = Patient.find(params[:patient_id])
  	if( patient.risk == nil || patient.desired_inr == nil || patient.initial_dose == nil )
  		redirect_to init_patient_path(current_user, patient)
  	end
  end
end
