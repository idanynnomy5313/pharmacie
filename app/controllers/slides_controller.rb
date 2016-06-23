class SlidesController < ApplicationController
  before_action :set_slide, only: [:show, :edit, :update, :destroy]

  # GET /slides
  # GET /slides.json
  def index
    @title = "Visite guidée"
    @slides = Slide.all
  end

  # GET /slides/1
  # GET /slides/1.json
  def show
  end

  # GET /slides/new
  def new
    admin_only
    @title = "Ajouter une diapositive"
    @slide = Slide.new
  end

  # GET /slides/1/edit
  def edit
    admin_only
    @tite = "Modifier une diapositive"
  end

  # POST /slides
  # POST /slides.json
  def create
    admin_only
    return if params[:attachment].blank?

    @attachment = Attachment.new
    @attachment.uploaded_file = params[:attachment]

    @slide = Slide.new
    @slide.description = params[:description]

    if @attachment.save
      @slide.id_attachment = @attachment.id
      if @slide.save
        redirect_to "/slides", notice: 'La diapositive a bien été ajoutée.'
      else
        attachment.delete
        render :new
      end
    else
      render :new
    end
  end

  # PATCH/PUT /slides/1
  # PATCH/PUT /slides/1.json
  def update
    admin_only
    respond_to do |format|
      if @slide.update(slide_params)
        format.html { redirect_to @slide, notice: 'La diapositive a bien été modifiée.' }
        format.json { render :show, status: :ok, location: @slide }
      else
        format.html { render :edit }
        format.json { render json: @slide.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /slides/1
  # DELETE /slides/1.json
  def destroy
    admin_only
    Attachment.find(@slide.id_attachment).destroy
    @slide.destroy
    respond_to do |format|
      format.html { redirect_to slides_url, notice: 'La diapositive a bien été supprimée.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_slide
      @slide = Slide.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def slide_params
      params.require(:slide).permit(:id_attachment, :description)
    end
end
