class AddAnswerModeToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :answermode, :boolean
  end
end
