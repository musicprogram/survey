class AddNroIdentificacionToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :nro_identificacion, :string
  end
end
