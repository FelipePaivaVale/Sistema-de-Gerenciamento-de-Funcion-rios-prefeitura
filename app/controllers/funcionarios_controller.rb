class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ show edit update destroy ]
  before_action :authenticate_user!
  before_action :authorize_funcionario, only: %i[index show new create edit update destroy]

  # GET /funcionarios or /funcionarios.json
  def index
    @q = Funcionario.ransack(params[:q])
    @funcionario = @q.result.includes(:departamento)

    @departamentos = Departamento.all.pluck(:nome, :id)
    @funcionarios = Funcionario.all

    if params[:departamento_id].present?
      @funcionarios = @funcionarios.where(departamento_id: params[:departamento_id])
    end

    
    if params[:data_contratacao_inicial].present? && params[:data_contratacao_final].present?
      @funcionarios = @funcionarios.where(contratação: params[:data_contratacao_inicial]..params[:data_contratacao_final])
    end
  end

  # GET /funcionarios/1 or /funcionarios/1.json
  def show
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios or /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionario was successfully created." }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionario was successfully updated." }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  def destroy
    @funcionario.destroy!

    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: "Funcionario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def funcionario_params
      params.require(:funcionario).permit(
        :nome,
        :nascimento,
        :genero,
        :cpf,
        :rg,
        :rua,
        :numero,
        :complemento,
        :bairro,
        :cidade,
        :estado,
        :cep,
        :telefone,
        :email,
        :departamento_id,
        :cargo_id,
        :contratação,
        :salario,
        :status
      )
    end
    
    def authorize_funcionario
      authorize @funcionario || Funcionario
    end
end
