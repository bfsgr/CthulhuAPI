class Pick < ApplicationRecord
    has_and_belongs_to_many :occupations
    has_and_belongs_to_many :skills
    has_one :game_set

    validates :numberOfPicks, presence: true, numericality: { 
        only_integer: true,
        less_than: 9,
        greater_than: 0
    }
    validates :pickAny, inclusion: [true, false]
end
