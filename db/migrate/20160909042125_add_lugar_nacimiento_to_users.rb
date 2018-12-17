class AddLugarNacimientoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lugar_nacimiento, :string
  end
end
