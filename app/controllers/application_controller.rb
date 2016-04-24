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

  def require_doctor_login
    if (current_user.class.name.downcase  != "doctor" || params[:id].to_i != current_user.id)
      flash[:danger] = "You are not authorized to see here."
      redirect_to current_user
    end
  end

  def require_patient_login
    if (current_user.class.name.downcase != "patient" || params[:id].to_i != current_user.id)
      flash[:danger] = "You are not authorized to see here."
      redirect_to current_user
    end
  end

  def require_login
    unless logged_in?
      redirect_to root_path
    end
  end

  def require_patient_ownership
    patient = Patient.find(params[:patient_id])
    unless patient.doctor == current_user
      redirect_to current_user
    end
  end

  def require_logout
    if logged_in?
      redirect_to current_user
    end
  end
end
