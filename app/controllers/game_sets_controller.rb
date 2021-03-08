class GameSetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @game_sets = GameSet.where(user: current_user)
    render 'index'
  end

  def show
    id = params['id']
    @game_set = GameSet.find(id)
    render 'show'
  end

  def create; end

  def update; end

  def destroy; end
end
