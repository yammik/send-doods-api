class Drawing < ApplicationRecord
  serialize :line, JSON
  belongs_to :game
end
