class Cuestionario < ApplicationRecord
  belongs_to :user
  has_many :respuestas, dependent: :destroy

  accepts_nested_attributes_for :respuestas

  def get_respuestas(pregunta)
    if self.respuestas.any?
      self.respuestas.where(pregunta: pregunta).any? ? self.respuestas.where(pregunta: pregunta) : self.respuestas.build
    else
      self.respuestas.build
    end
  end

  def resultado_labels
    if self.user.genero
      ['Natural', 'Tradicional', 'Elegante', 'Romántico', 'Seductor', 'Creativo', 'Drámatico']
    else
      ['Natural', 'Tradicional', 'Elegante', 'Romántica', 'Seductora', 'Creativa', 'Drámatica']
    end
  end

  def resultados
    [self.get_a, self.get_b, self.get_c, self.get_d, self.get_e, self.get_f, self.get_g]
  end

  def get_a
    self.respuestas.where(opcion: 1).count
  end

  def get_b
    self.respuestas.where(opcion: 2).count
  end

  def get_c
    self.respuestas.where(opcion: 3).count
  end

  def get_d
    self.respuestas.where(opcion: 4).count
  end

  def get_e
    self.respuestas.where(opcion: 5).count
  end

  def get_f
    self.respuestas.where(opcion: 6).count
  end

  def get_g
    self.respuestas.where(opcion: 7).count
  end

  def get_step
    case self.paso
      when 1
        :pregunta_uno
      when 2
        :pregunta_dos
      when 3
        :pregunta_tres
      when 4
        :pregunta_cuatro
      when 5
        :pregunta_cinco
      when 6
        :pregunta_seis
      when 7
        :pregunta_siete
      when 8
        :pregunta_ocho
      when 9
        :pregunta_nueve
      when 10
        :pregunta_diez
      when 11
        :pregunta_once
      when 12
        :pregunta_doce
      when 13
        :pregunta_trece
      when 14
        :pregunta_catorce
      when 15
        :pregunta_quince
      when 16
        :pregunta_dieciseis
      when 17
        :pregunta_diecisiete
    end
  end
end
