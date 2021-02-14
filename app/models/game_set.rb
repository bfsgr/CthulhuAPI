class GameSet < ApplicationRecord
    has_many :skills, dependent: :destroy
    has_many :occupations, dependent: :destroy
    has_many :picks, dependent: :destroy

    belongs_to :user, dependent: :destroy
end
