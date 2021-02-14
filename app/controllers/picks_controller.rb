class PicksController < ApplicationController
    before_action :authenticate_user!
    def index
        @picks = Pick.all
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
