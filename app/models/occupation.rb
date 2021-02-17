class Occupation < ApplicationRecord
    has_and_belongs_to_many :skills
    has_and_belongs_to_many :picks
    belongs_to :game_set, dependent: :destroy
end
