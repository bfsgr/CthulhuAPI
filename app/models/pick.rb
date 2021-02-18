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

    validate :check_if_skills_are_in_gameset, :check_minimum_skills

    #check if the skills belong to the same gameset as the pick
    def check_if_skills_are_in_gameset
        if not self.pickAny
            self.skills.each do |s|
                if s.game_set_id != self.game_set_id
                    errors.add(:skills, 'skill are not in same game set')  
                end
            end
        end 
    end

    #check if the number of skills associated with this pick is correct given
    #the number of picks and the pick any flag
    def check_minimum_skills
        if not self.pickAny
            if self.skills.length <= self.numberOfPicks
                errors.add(:skills, 'not enough skills to pick')
            end
        else
            if self.skills.length != 0
                errors.add(:skills, "shouldn't have skills since pickAny is true")
            end
        end

        rescue ArgumentError

    end


end
