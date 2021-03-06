class SkillsController < ApplicationController
  include Pagy::Backend

  before_action :authenticate_user!
  after_action { pagy_headers_merge(@pagy) if @pagy }

  def index
    @pagy, @skills = pagy(current_user.game_sets.find(params[:game_set_id]).skills)
    render 'index'
  end

  def show
    @skill = Skill.find_skill_with_user(current_user, params[:id])
    render 'show'
  end

  def create
    @skill = Skill.new(permitted_params)
    @skill.game_set = current_user.game_sets.find(params[:game_set_id])

    if @skill.save
      render 'show', status: :created, location: skill_path(@skill)
    else
      render 'create', status: :unprocessable_entity
    end
  end

  def update
    @skill = Skill.find_skill_with_user(current_user, params[:id])

    if @skill.update(permitted_params)
      render 'show', status: :ok, location: skill_path(@skill)
    else
      render 'create', status: :unprocessable_entity
    end
  end

  def destroy
    skill = Skill.find_skill_with_user(current_user, params[:id])
    skill.delete
  end

  private

  def permitted_params
    return {} if !params[:skill] || params[:skill].empty?

    params.require(:skill).permit(:name, :base_value)
  end
end
