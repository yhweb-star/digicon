class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    if resource_class == User
      devise_parameter_sanitizer.permit(:sign_up, keys: [:facility, :grade, :last_name, :first_name, :last_name_kana, :first_name_kana, :phone])
    elsif resource_class == School
      devise_parameter_sanitizer.permit(:sign_up, keys: [:facility, :ceo, :phone])
    else
      super
    end
  end
end
