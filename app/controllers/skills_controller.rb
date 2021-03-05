class SkillsController < ApplicationController
	before_action :authenticate_user!
	def index
		@skills = Skill.all
		render 'index'
	end

	def show
	end

	def create
	end

	def update
	end

	def destroy
	end
end
