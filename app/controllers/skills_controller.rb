class SkillsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    @pagy, @skills = pagy(GameSet.where(user: current_user).find(params[:game_set_id]).skills)
    render 'index'
  end

  def show; end

  def create; end

  def update; end

  def destroy; end
end
