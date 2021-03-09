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

  def create
    @game_set = GameSet.new(permitted_params)
    @game_set.user = current_user

    if @game_set.save
      response.headers['Location'] = request.original_url + game_set_path(@game_set)
      head :created
    else
      render 'create', status: :unprocessable_entity
    end
  end

  def update; end

  def destroy; end

  private

  def permitted_params
    params.require(:game_set).permit(:name) if params[:game_set] && !params[:game_set].empty?
  end
end
