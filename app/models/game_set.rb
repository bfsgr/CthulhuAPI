class GameSet < ApplicationRecord
  include ActiveRecord::Serialization
  has_many :skills, dependent: :destroy
  has_many :occupations, dependent: :destroy
  has_many :picks, dependent: :destroy

  belongs_to :user, dependent: :destroy

  validates :name, presence: true, length: { in: 3..25 }, uniqueness: { scope: :user }

  def attributes
    { id: nil, name: nil, created_at: nil, updated_at: nil }
  end
end
