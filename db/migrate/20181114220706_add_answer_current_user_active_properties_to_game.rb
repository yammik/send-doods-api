class AddAnswerCurrentUserActivePropertiesToGame < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :active, :boolean
    add_column :games, :current, :string
    add_column :games, :answer, :string
  end
end
