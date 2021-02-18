class Pick < ApplicationRecord
    has_and_belongs_to_many :occupations
    has_and_belongs_to_many :skills
    belongs_to :game_set, dependent: :destroy

    validates :numberOfPicks, presence: true, numericality: { 
        only_integer: true,
        less_than: 9,
        greater_than: 0
    }
    validates :pickAny, inclusion: [true, false]
    validates :name, presence: true, :length => { :in => 5..50 }
end
