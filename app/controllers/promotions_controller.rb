class PromotionsController < ApplicationController
  before_action :set_promotion, only: [:show, :edit, :update, :destroy]

  # GET /promotions
  # GET /promotions.json
  def index
    @title ="Promotions"
    @promotions = Promotion.all
  end

  # GET /promotions/1
  # GET /promotions/1.json
  def show
  end

  # GET /promotions/new
  def new
    admin_only
    @title = "Ajout d'une promotion"
    @promotion = Promotion.new
  end

  # GET /promotions/1/edit
  def edit
    admin_only
    @title = "Modification d'une promotion"
  end

  # POST /promotions
  # POST /promotions.json
  def create
    admin_only
    return if params[:attachment].blank?

    @attachment = Attachment.new
    @attachment.uploaded_file = params[:attachment]

    @promotion = Promotion.new
    @promotion.description = params[:description]

    if @attachment.save
      @promotion.id_attachment = @attachment.id
      if @promotion.save
        redirect_to "/promotions", notice: "La promotion a bien été ajoutée."
      else
        attachment.delete
        render :new
      end
    else
      render :new
    end
  end

  # PATCH/PUT /promotions/1
  # PATCH/PUT /promotions/1.json
  def update
    admin_only
    respond_to do |format|
      if @promotion.update(promotion_params)
        format.html { redirect_to @promotion, notice: 'La promotion a bien été modifiée.' }
        format.json { render :show, status: :ok, location: @promotion }
      else
        format.html { render :edit }
        format.json { render json: @promotion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /promotions/1
  # DELETE /promotions/1.json
  def destroy
    admin_only
    Attachment.find(@promotion.id_attachment).destroy
    @promotion.destroy
    respond_to do |format|
      format.html { redirect_to promotions_url, notice: 'La promotion a bien été supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_promotion
      @promotion = Promotion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def promotion_params
      params.require(:promotion).permit(:id_attachment, :description)
    end
end
