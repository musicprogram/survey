class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if resource.cuestionario.blank?
      cuestionarios_path
    else
      root_path
    end
  end

  def after_update_path_for(resource)
    puts resource.cuestionario.blank?
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
