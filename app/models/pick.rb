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

	validate :skills_are_in_gameset, :empty_skills_with_pick_any, :enough_skills_to_pick

	# check if the skills belong to the same gameset as the pick
	def skills_are_in_gameset
		return if pickAny

		skills.each do |s|
			errors.add(:skills, 'skill are not in same game set') if s.game_set_id != game_set_id
		end
	end

	# check if skills are empty if pickAny is true
	def empty_skills_with_pick_any
		errors.add(:skills, "shouldn't have skills since pickAny is true") if pickAny and not skills.empty?
	rescue ArgumentError
	end

	# check if there are enough skills to pick when pickAny is false
	def enough_skills_to_pick
		errors.add(:skills, 'not enough skills to pick') if not pickAny and skills.length <= numberOfPicks
	rescue ArgumentError
	end
end
