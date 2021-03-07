class OccupationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @occupations = Occupation.all
    render 'index'
  end

  def show; end

  def create; end

  def update; end

  def destroy; end
end
