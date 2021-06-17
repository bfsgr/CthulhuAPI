class GameSetsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    @pagy, @game_sets = pagy(current_user.game_sets)
    render 'index'
  end

  def show
    @game_set = current_user.game_sets.find(params[:id])
    render 'show'
  end

  def create
    @game_set = GameSet.new(permitted_params)
    @game_set.user = current_user

    if @game_set.save
      render 'show', status: :created, location: game_set_path(@game_set)
    else
      render 'create', status: :unprocessable_entity
    end
  end

  def update
    @game_set = current_user.game_sets.find(params[:id])

    if @game_set.update(permitted_params)
      render 'show', status: :ok, location: game_set_path(@game_set)
    else
      render 'create', status: :unprocessable_entity
    end
  end

  def destroy
    current_user.game_sets.find(params[:id]).delete
  end

  private

  def permitted_params
    params.require(:game_set).permit(:name) if params[:game_set] && !params[:game_set].empty?
  end
end
