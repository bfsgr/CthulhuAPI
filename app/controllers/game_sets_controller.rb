class GameSetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @game_sets = GameSet.where(user: current_user)
    render 'index'
  end

  def show; end

  def create; end

  def update; end

  def destroy; end
end
