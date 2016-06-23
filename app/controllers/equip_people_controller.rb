class EquipPeopleController < ApplicationController
  before_action :set_equip_person, only: [:show, :edit, :update, :destroy]

  # GET /equip_people
  # GET /equip_people.json
  def index
    @title = "L'équipe"
    @equip_people = EquipPerson.all
  end

  # GET /equip_people/1
  # GET /equip_people/1.json
  def show
  end

  # GET /equip_people/new
  def new
    admin_only
    @title = "Ajout d'un membre de l'équipe"
    @equip_person = EquipPerson.new
  end

  # GET /equip_people/1/edit
  def edit
    admin_only
    @title = "Modifier un membre de l'équipe"
  end

  # POST /equip_people
  # POST /equip_people.json
  def create
    admin_only
    return if params[:attachment].blank?

    @attachment = Attachment.new
    @attachment.uploaded_file = params[:attachment]

    @equip_person = EquipPerson.new
    @equip_person.name = params[:name]
    @equip_person.description = params[:description]

    respond_to do |format|
      if @attachment.save
        @equip_person.id_attachment = @attachment.id
        if @equip_person.save
          #format.html { redirect_to @equip_person, notice: 'Equip person was successfully created.' }
          #format.json { render :show, status: :created, location: @equip_person }
          format.html { redirect_to "equip_people", notice: "Le membre de l'équipe a bien été ajouté." }
          format.json { render "equip_people", status: :created }
        else
          @attachment.delete
          format.html { render :new }
          format.json { render json: @equip_person.errors, status: :unprocessable_entity }
        end
      else
        format.html { render :new }
        format.json { render json: @equip_person.errors, status: :unprocessable_entity }
      end
    end
=begin
    respond_to do |format|
      if @equip_person.save
        format.html { redirect_to @equip_person, notice: 'Equip person was successfully created.' }
        format.json { render :show, status: :created, location: @equip_person }
      else
        format.html { render :new }
        format.json { render json: @equip_person.errors, status: :unprocessable_entity }
      end
    end
=end
  end

  # PATCH/PUT /equip_people/1
  # PATCH/PUT /equip_people/1.json
  def update
    admin_only
    respond_to do |format|
      if @equip_person.update(equip_person_params)
        format.html { redirect_to @equip_person, notice: 'Le membre de l\'équipe a bien été modifié.' }
        format.json { render :show, status: :ok, location: @equip_person }
      else
        format.html { render :edit }
        format.json { render json: @equip_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equip_people/1
  # DELETE /equip_people/1.json
  def destroy
    Attachment.find(@equip_person.id_attachment).destroy
    @equip_person.destroy
    respond_to do |format|
      format.html { redirect_to equip_people_url, notice: 'Le membre de l\'équipe a bien été retiré.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equip_person
      @equip_person = EquipPerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equip_person_params
      params.require(:equip_person).permit(:name, :id_attachment, :description)
    end
end
