class Occupation < ApplicationRecord
    has_and_belongs_to_many :skills
    has_and_belongs_to_many :picks
    belongs_to :game_set, dependent: :destroy

    validates :name, presence: true, :length => { in: 5..25 }, uniqueness: { scope: :game_set }
    validates :calcType, presence: true
    validates :min_credit, presence: true, numericality: { 
        only_integer: true,
        less_than: 100,
        greater_than: 0
    }

    validates :max_credit, presence: true, numericality: { 
        only_integer: true,
        less_than: 100,
        greater_than: 0
    }

    validate :validate_creditLevel, :check_if_skills_are_in_gameset, :check_if_picks_are_in_gameset

    def check_if_picks_are_in_gameset
        not_in_game_set = false
        
        self.picks.each do |p|
            not_in_game_set = true if p.game_set_id != self.game_set_id
        end
        
        errors.add(:picks, 'should be in the same game set') if not_in_game_set
    end

    def check_if_skills_are_in_gameset
        not_in_game_set = false

        self.skills.each do |s|
            not_in_game_set = true if s.game_set_id != self.game_set_id
        end

        errors.add(:skills, 'are not in same game set') if not_in_game_set
    end

    def validate_creditLevel
        if self.min_credit > self.max_credit
            errors.add(:min_credit, "should be less or equal than max credit") 
        end

        rescue NoMethodError
    end
end
