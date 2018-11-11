class AddLineToDrawings < ActiveRecord::Migration[5.2]
  def change
    add_column :drawings, :line, :text
    remove_column :drawings, :content
  end
end
