class Occupation < ApplicationRecord
    has_and_belongs_to_many :skills
    has_and_belongs_to_many :picks
    belongs_to :game_set, dependent: :destroy

    validates :name, presence: true, :length => { in: 5..25 }
    validates :calcType, presence: true
    validates :creditLevel, presence: true, :length => { is: 2 }

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
        if self.creditLevel.length == 2
            
            all_int = true
            
            self.creditLevel.each do |c|
                if c.is_a?(Integer) 
                    errors.add(:creditLevel, "#{c} should be within 1 and 99") unless c > 0 && c < 100
                else
                    all_int = false
                end
            end  

            sorted = self.creditLevel.sort if all_int
            
            errors.add(:creditLevel, "should be int") unless all_int
            errors.add(:creditLevel, "should be 2 integers sorted") unless sorted == self.creditLevel

        end
    end
end
