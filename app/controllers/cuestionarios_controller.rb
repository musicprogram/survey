class CuestionariosController < ApplicationController
  load_and_authorize_resource
  before_action :set_cuestionario, only: [:show, :edit, :update, :destroy]

  # GET /cuestionarios
  # GET /cuestionarios.json
  def index
    @cuestionarios = Cuestionario.all
  end

  # GET /cuestionarios/1
  # GET /cuestionarios/1.json
  def show
  end

  # GET /cuestionarios/new
  def new
    create
  end

  # GET /cuestionarios/1/edit
  def edit
  end

  # POST /cuestionarios
  # POST /cuestionarios.json
  def create
    @cuestionario = Cuestionario.new
    @cuestionario.user_id = current_user.id

    respond_to do |format|
      if @cuestionario.save
        if @cuestionario.user.try(:genero)
          url = h_pregunta_url(:pregunta_uno)
        else
          url = pregunta_url(:pregunta_uno)
        end
        format.html { redirect_to url, notice: 'Cuestionario was successfully created.' }
        format.json { render :show, status: :created, location: @cuestionario }
      else
        format.html { render :new }
        format.json { render json: @cuestionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cuestionarios/1
  # PATCH/PUT /cuestionarios/1.json
  def update
    respond_to do |format|
      if @cuestionario.update(cuestionario_params)
        format.html { redirect_to @cuestionario, notice: 'Cuestionario was successfully updated.' }
        format.json { render :show, status: :ok, location: @cuestionario }
      else
        format.html { render :edit }
        format.json { render json: @cuestionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cuestionarios/1
  # DELETE /cuestionarios/1.json
  def destroy
    @cuestionario.destroy
    respond_to do |format|
      format.html { redirect_to cuestionarios_url, notice: 'Cuestionario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_cuestionario
    @cuestionario = Cuestionario.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def cuestionario_params
    params.require(:cuestionario).permit(:user_id, :estado, :paso,
                                         respuestas_attributes: [:id, :pregunta, :opcion])
  end
end
