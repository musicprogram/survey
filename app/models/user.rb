class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :cuestionario, dependent: :destroy
  has_many :assignments, dependent: :destroy
  has_many :roles, through: :assignments

  validates :nombre, :tipo_identificacion, :nro_identificacion, :fecha_nacimiento, :lugar_nacimiento, presence: true
  validates :terminos, acceptance: true

  before_create :set_role

  def set_role
    self.role_ids = [2]
  end

  def tipo_identificacion_collection
    [
        ['Cédula de Cuidadanía', 0],
        ['Tarjeta de Identidad', 1],
        ['Cédula de Extranjería', 2],
        ['Pasaporte', 3],
        ['Documento Nacional de Identificación', 4],
        ['Número de Identificación Tributaria', 5]
    ]
  end

  def get_tipo_identificacion
    self.tipo_identificacion_collection.select { |t, n| n == self.tipo_identificacion }[0][0]
  end

  def get_genero
    self.genero ? 'Masculino' : 'Femenino'
  end

  def get_lugar_residencia
    self.lugar_residencia.blank? ? 'Sin registrar' : self.lugar_residencia
  end

  def get_telefono
    self.telefono.blank? ? 'Sin registrar' : self.telefono
  end

  def has_role?(role_sym)
    roles.any? { |r| r.nombre.underscore.to_sym == role_sym }
  end
end