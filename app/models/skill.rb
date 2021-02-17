class Skill < ApplicationRecord
    has_and_belongs_to_many :occupations
    has_and_belongs_to_many :picks
    belongs_to :game_set, dependent: :destroy

    validates :name, :presence => true, :length => { :in => 4..50 }
    validates :baseValue, :presence => true, numericality: {
        only_integer: true,
        less_than: 100,
        greater_than_or_equal_to: 0
    }
end
