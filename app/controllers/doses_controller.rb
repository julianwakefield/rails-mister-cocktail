class DosesController < ApplicationController
    def new
        @dose = Dose.new
    end

    def create
        new_dose = Dose.new(dose_params)
        @cocktail = Cocktail.find(params[:cocktail_id])
        new_dose.cocktail = @cocktail
        new_dose.save
        redirect_to cocktail_path(@cocktail)
    end 

    def destroy
        @dose = Dose.find(params[:id])
        @dose.destroy
        redirect_to cocktail_path(@dose.cocktail)
      end

    private

    def dose_params
        params.require(:dose).permit(:description, :ingredient_id)

    end
end
