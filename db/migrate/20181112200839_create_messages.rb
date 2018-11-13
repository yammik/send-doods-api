class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :text
      t.references :game, foreign_key: true
      t.string :user_name

      t.timestamps
    end
  end
end
