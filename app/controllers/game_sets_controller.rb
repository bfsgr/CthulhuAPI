class GameSetsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    @pagy, @game_sets = pagy(GameSet.where(user: current_user))
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
      render json: @game_set, status: :created, location: game_set_path(@game_set)
    else
      render 'create', status: :unprocessable_entity
    end
  end

  def update
    user = current_user
    @game_set = GameSet.where(id: params[:id], user_id: user.id).first

    return head :not_found unless @game_set

    if @game_set.update(permitted_params)
      render json: @game_set, status: :ok, location: game_set_path(@game_set)
    else
      render 'create', status: :unprocessable_entity
    end
  end

  def destroy; end

  private

  def permitted_params
    params.require(:game_set).permit(:name) if params[:game_set] && !params[:game_set].empty?
  end
end
