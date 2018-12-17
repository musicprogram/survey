class HPreguntasController < ApplicationController
  include Wicked::Wizard
  before_action :set_cuestionario, only: [:show, :update]

  steps :pregunta_uno, :pregunta_dos, :pregunta_tres, :pregunta_cuatro, :pregunta_cinco, :pregunta_seis,
        :pregunta_siete, :pregunta_ocho, :pregunta_nueve, :pregunta_diez, :pregunta_once, :pregunta_doce,
        :pregunta_trece, :pregunta_catorce

  def show
    render_wizard
  end

  def update
    @cuestionario.attributes = cuestionario_params
    render_wizard @cuestionario
  end

  def finish_wizard_path
    cuestionario_path(current_user.cuestionario)
  end

  private

  def set_cuestionario
    @cuestionario = current_user.cuestionario
  end

  def cuestionario_params
    params.require(:cuestionario).permit(:user_id, :estado, :paso,
                                         respuestas_attributes: [:id, :pregunta, :opcion])
  end
end
