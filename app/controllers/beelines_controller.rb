class BeelinesController < ApplicationController
  def create
    @read = Read.find(params[:read_id])
    @beeline = @read.beelines.create(params[:beeline])
    redirect_to read_path(@read)
  end
  
  def destroy
    @read = Read.find(params[:read_id])
    @beeline = @read.beelines.find(params[:id])
    @beeline.destroy
    redirect_to read_path(@read)
  end
  
end
