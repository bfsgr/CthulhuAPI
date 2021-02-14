class Skill < ApplicationRecord
    has_and_belongs_to_many :occupations
    has_and_belongs_to_many :picks
    has_one :game_set
end
