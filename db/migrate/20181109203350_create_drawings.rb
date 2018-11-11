class CreateDrawings < ActiveRecord::Migration[5.2]
  def change
    create_table :drawings do |t|
      t.string :content
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
