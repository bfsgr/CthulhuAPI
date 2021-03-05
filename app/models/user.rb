class User < ApplicationRecord
	include Devise::JWT::RevocationStrategies::JTIMatcher
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
								:rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

	validates :username, presence: true, uniqueness: true, length: { in: 4..255 }

	has_many :game_set
end
