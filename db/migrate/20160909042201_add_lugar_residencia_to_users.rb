class AddLugarResidenciaToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :lugar_residencia, :string
  end
end
