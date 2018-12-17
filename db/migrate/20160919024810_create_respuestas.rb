class CreateRespuestas < ActiveRecord::Migration[5.0]
  def change
    create_table :respuestas do |t|
      t.references :cuestionario, foreign_key: true
      t.integer :pregunta
      t.integer :opcion, default: 1

      t.timestamps
    end
  end
end
