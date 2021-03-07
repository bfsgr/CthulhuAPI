class Pick < ApplicationRecord
  has_and_belongs_to_many :occupations
  has_and_belongs_to_many :skills
  belongs_to :game_set, dependent: :destroy

  validates :number_of_picks, presence: true, numericality: {
    only_integer: true,
    less_than: 9,
    greater_than: 0
  }
  validates :pick_any, inclusion: [true, false]
  validates :name, presence: true, length: { in: 5..50 }, uniqueness: { scope: :game_set }

  validate :skills_are_in_gameset, :empty_skills_with_pick_any, :enough_skills_to_pick

  # check if the skills belong to the same gameset as the pick
  def skills_are_in_gameset
    return if pick_any

    skills.each do |s|
      errors.add(:skills, 'skill are not in same game set') if s.game_set_id != game_set_id
    end
  end

  # check if skills are empty if pick_any is true
  def empty_skills_with_pick_any
    errors.add(:skills, "shouldn't have skills since pick_any is true") if pick_any && !skills.empty?
  rescue ArgumentError
  end

  # check if there are enough skills to pick when pick_any is false
  def enough_skills_to_pick
    errors.add(:skills, 'not enough skills to pick') if !pick_any && (skills.length <= number_of_picks)
  rescue ArgumentError
  end
end
