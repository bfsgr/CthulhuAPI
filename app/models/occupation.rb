class Occupation < ApplicationRecord
    has_and_belongs_to_many :skills
    has_and_belongs_to_many :picks
    has_one :game_set
end
