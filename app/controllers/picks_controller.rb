class PicksController < ApplicationController
	before_action :authenticate_user!
	def index
		@user = current_user
		@picks = @user.game_set.first.picks
		render 'index'
	end

	def show; end

	def create; end

	def update; end

	def destroy; end
end
