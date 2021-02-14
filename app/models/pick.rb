class Pick < ApplicationRecord
    has_and_belongs_to_many :occupations
    has_and_belongs_to_many :skills
    has_one :game_set
end
