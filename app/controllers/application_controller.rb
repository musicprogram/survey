class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    render file: "#{Rails.root}/public/403.html.erb", status: 403, layout: 'blank'
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in) do |user_params|
      user_params.permit(:email, :password, :remember_me)
    end

    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
      user_params.permit(:email, :password, :password_confirmation,
                         :nombre, :tipo_identificacion, :nro_identificacion,
                         :fecha_nacimiento, :lugar_nacimiento, :lugar_residencia,
                         :genero, :telefono, :terminos)
    end

    devise_parameter_sanitizer.permit(:account_update) do |user_params|
      user_params.permit(:email, :password, :password_confirmation, :current_password,
                         :nombre, :tipo_identificacion, :nro_identificacion,
                         :fecha_nacimiento, :lugar_nacimiento, :lugar_residencia,
                         :genero, :telefono)
    end
  end

  def after_sign_in_path_for(resource)
    if resource.cuestionario.blank?
      cuestionarios_path
    elsif resource.cuestionario.present? && !resource.cuestionario.estado
      if resource.genero
        h_pregunta_path(resource.cuestionario.get_step)
      else
        pregunta_path(resource.cuestionario.get_step)
      end
    else
      root_path
    end
  end
end
