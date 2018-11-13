class Game < ApplicationRecord
  has_many :drawings
  has_many :messages
end
