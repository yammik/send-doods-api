class AddUserIdToDrawings < ActiveRecord::Migration[5.2]
  def change
    add_column :drawings, :userId, :text
  end
end
