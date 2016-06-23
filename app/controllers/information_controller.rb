class InformationController < ApplicationController

  before_action :set_information, only: [:show, :edit]

  def show
    @title = @information.show_title
  end

  def edit
    admin_only
  end

  def update
    admin_only
  	respond_to do |format|
  		@information = Information.find(params[:id])
  		if(@information.update(information_params))
  			format.html {redirect_to "/"+@information.name, notice: 'Le message a bien été modifié.'}
  			format.json {render :show, status: :ok, location: @information}
  		else
  			format.html {render :edit}
  			format.json {render json: @information.errors, status: :unprocessable_entity}
  		end
  	end
  end

  private
  	def set_information
  		@information = Information.where(name: params[:name]).first
  		#@information = Information.find(params[:id])
  	end

  	def information_params
  		params.require(:information).permit(:content)
  	end
end
