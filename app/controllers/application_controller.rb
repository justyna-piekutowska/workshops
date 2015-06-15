class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  protect_from_forgery with: :exception

  protected
    def configure_permitted_parameters
      sign_up_params = devise_parameter_sanitizer.for(:sign_up)
      sign_up_params << :firstname
      sign_up_params << :lastname
    end
end
