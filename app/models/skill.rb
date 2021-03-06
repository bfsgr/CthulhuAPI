class Skill < ApplicationRecord
  has_and_belongs_to_many :occupations
  has_and_belongs_to_many :picks
  belongs_to :game_set, dependent: :destroy

  validates :name, presence: true, length: { in: 4..50 }, uniqueness: { scope: :game_set }
  validates :base_value, presence: true, numericality: {
    only_integer: true,
    less_than: 100,
    greater_than_or_equal_to: 0
  }

  def self.find_skill_with_user(user, id)
    skill = find(id)

    raise ActiveRecord::RecordNotFound if skill.game_set.user != user

    skill
  end
end
