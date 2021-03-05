class User < ApplicationRecord
	include Devise::JWT::RevocationStrategies::JTIMatcher
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
								:rememberable, :validatable, :jwt_authenticatable, jwt_revocation_strategy: self

	validates :username, presence: true, uniqueness: { case_sensitive: false }, length: { in: 4..25 }
	validates_format_of :username, with: /^[a-zA-Z0-9_.]*$/, multiline: true

	has_many :game_sets
end
