class AddTerminosToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :terminos, :boolean, default: false
  end
end
