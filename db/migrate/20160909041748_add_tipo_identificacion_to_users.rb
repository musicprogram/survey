class AddTipoIdentificacionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :tipo_identificacion, :integer, default: 0
  end
end
