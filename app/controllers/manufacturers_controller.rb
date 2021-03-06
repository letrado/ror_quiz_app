class ManufacturersController < ApplicationController

  def index
    @manufacturers = Manufacturer.all
  end

  def show
    @manufacturer = Manufacturer.find(params[:id])
  end

  def edit
    @manufacturer = Manufacturer.find(params[:id])
  end

  def update
    @manufacturer = Manufacturer.find(params[:id])
    @manufacturer.update(params.require(:manufacturer).permit(:name, :domestic))
    flash[:notice] = "Manufacturer successfully updated!"
    redirect_to manufacturer_path
  end

  def destroy
    @manufacturer=Manufacturer.find(params[:id])
    @manufacturer.destroy

    flash.notice="'#{@manufacturer.name}' was deleted"

    redirect_to root_path
  end

end
