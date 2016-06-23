class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]

  # GET /equipment
  # GET /equipment.json
  def index
    @title = "Équipements"
    @equipment = Equipment.all
  end

  # GET /equipment/1
  # GET /equipment/1.json
  def show
  end

  # GET /equipment/new
  def new
    admin_only
    @title = "Ajout d'un équipement"
    @equipment = Equipment.new
  end

  # GET /equipment/1/edit
  def edit
    admin_only
    @title = "Modification d'un équipement"
  end

  # POST /equipment
  # POST /equipment.json
  def create
    admin_only
    return if params[:attachment].blank?

    @attachment = Attachment.new
    @attachment.uploaded_file = params[:attachment]

    @equipment = Equipment.new
    @equipment.description = params[:description]

    #respond_to do |format|
      if @attachment.save
        @equipment.id_attachment = @attachment.id
        if @equipment.save
          redirect_to action: "index", notice: "L'équipement a bien été ajouté."
        else
          attachment.delete
          render :new
        end
      else
        render :new
      end
    #end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    admin_only
    respond_to do |format|
      if @equipment.update(equipment_params)
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { render :show, status: :ok, location: @equipment }
      else
        format.html { render :edit }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    admin_only
    Attachment.find(@equipment.id_attachment).destroy
    @equipment.destroy
    respond_to do |format|
      format.html { redirect_to equipment_index_url, notice: 'Equipment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:id_attachment, :description)
    end
end
