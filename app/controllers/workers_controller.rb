class WorkersController < ApplicationController
  before_action :set_worker, only: [:show, :edit, :update, :destroy]

  # GET /workers
  # GET /workers.json
  def index
    @title = "Professionnels de la santé"
    @workers = Worker.all
  end

  # GET /workers/1
  # GET /workers/1.json
  def show
  end

  # GET /workers/new
  def new
    admin_only
    @title = "Ajout d'un professionnel de la santé"
    @worker = Worker.new
  end

  # GET /workers/1/edit
  def edit
    admin_only
  end

  # POST /workers
  # POST /workers.json
  def create
    admin_only
    @worker = Worker.new(worker_params)

=begin
    respond_to do |format|
      if @worker.save
        format.html { redirect_to @worker, notice: 'Worker was successfully created.' }
        format.json { render :show, status: :created, location: @worker }
      else
        format.html { render :new }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
=end

    if @worker.save
      redirect_to action: "index", notice: "Le professionnel de la santé a bien été ajouté."
    else
      render :new
    end
  end

  # PATCH/PUT /workers/1
  # PATCH/PUT /workers/1.json
  def update
    admin_only
    respond_to do |format|
      if @worker.update(worker_params)
        format.html { redirect_to @worker, notice: 'Le professionnel de la santé a bien été modifié.' }
        format.json { render :show, status: :ok, location: @worker }
      else
        format.html { render :edit }
        format.json { render json: @worker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /workers/1
  # DELETE /workers/1.json
  def destroy
    admin_only
    @worker.destroy
    respond_to do |format|
      format.html { redirect_to workers_url, notice: 'Le professionnel de la santé a bien été retiré.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_worker
      @worker = Worker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def worker_params
      params.require(:worker).permit(:name, :description, :address, :tel)
    end
end
