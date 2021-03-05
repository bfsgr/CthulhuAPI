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
	validates :name, presence: true, length: { in: 5..50 }, uniqueness: { scope: :game_set }

	validate :check_if_skills_are_in_gameset, :check_minimum_skills

	# check if the skills belong to the same gameset as the pick
	def check_if_skills_are_in_gameset
		return if pickAny

		skills.each do |s|
			errors.add(:skills, 'skill are not in same game set') if s.game_set_id != game_set_id
		end
	end

	# check if the number of skills associated with this pick is correct given
	# the number of picks and the pick any flag
	def check_minimum_skills
		if not pickAny
			errors.add(:skills, 'not enough skills to pick') if skills.length <= numberOfPicks
		elsif skills.empty?
			errors.add(:skills, "shouldn't have skills since pickAny is true")
		end
	rescue ArgumentError
	end
end
