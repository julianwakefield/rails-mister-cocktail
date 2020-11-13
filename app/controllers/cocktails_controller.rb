class CocktailsController < ApplicationController

    def index
        @cocktails = Cocktail.all
    end

    def show
        
        @cocktail = Cocktail.find(params[:id])
        @dose = Dose.new
    end

    def new
        @cocktail = Cocktail.new
    end
# create does not need an html.erb file
    def create
        @cocktail = Cocktail.new(cocktail_params)
        if @cocktail.save
            redirect_to @cocktail
        else
            render :new
        end
    end

    
    private

    def cocktail_params
        params.require(:cocktail).permit(:name)

    end
end
