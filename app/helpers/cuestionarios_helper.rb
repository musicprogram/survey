module CuestionariosHelper
  def get_cuestionario_url
    if current_user.genero
      h_pregunta_path(current_user.cuestionario.get_step)
    else
      pregunta_path(current_user.cuestionario.get_step)
    end
  end
end
