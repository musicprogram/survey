class CreateCuestionarios < ActiveRecord::Migration[5.0]
  def change
    create_table :cuestionarios do |t|
      t.references :user, foreign_key: true
      t.boolean :estado, default: false
      t.integer :paso, default: 1

      t.timestamps
    end
  end
end
