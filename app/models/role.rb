class Role < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments

  def nombre_capitalize
    self.nombre.capitalize
  end
end
