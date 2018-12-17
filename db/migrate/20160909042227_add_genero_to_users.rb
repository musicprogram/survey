class AddGeneroToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :genero, :boolean, default: true
  end
end
