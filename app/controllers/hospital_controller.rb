class HospitalController < ApplicationController
  def index
  	if params[:set_locale]
  		redirect_to patients_path(:locale => params[:set_locale])
  	else
  		redirect_to patients_path
  	end
  end
end
