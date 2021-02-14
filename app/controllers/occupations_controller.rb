class OccupationsController < ApplicationController
    def index
        @occupations = Occupation.all
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
