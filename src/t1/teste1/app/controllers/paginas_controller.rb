class PaginasController < ApplicationController

  respond_to :html, :json

  before_action :find_paginas,
                :only => [:show, :edit, :update, :destroy]

  # GET /paginas
  # GET /paginas.json
  def index
    @paginas = Pagina.all

    respond_with(@paginas)
  end

  # GET /paginas/1
  # GET /paginas/1.json
  def show
    respond_with(@pagina)
  end

  # GET /paginas/new
  # GET /paginas/new.json
  def new
    @pagina = Pagina.new
    @url_path = @pagina
    respond_with(@pagina)
  end

  # GET /paginas/1/edit
  def edit
    @url_path = pagina_path('pt')
  end

  # POST /paginas
  # POST /paginas.json
  def create
    @pagina = Pagina.new(pagina_params)

    respond_to do |format|
      if @pagina.save
        format.html { redirect_to paginas_path('pt'), notice: 'Cadastrada com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @pagina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paginas/1
  # PUT /paginas/1.json
  def update
    respond_to do |format|
      if @pagina.update_attributes(pagina_params)
        format.html { redirect_to paginas_path('pt'), notice: 'Alterada com sucesso!' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pagina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paginas/1
  # DELETE /paginas/1.json
  def destroy
    @pagina.destroy

    respond_to do |format|
      format.xml { head :ok }
      format.js { render json: @pagina.id, notice: 'Deletada com sucesso!' }
    end
  end

  private
  def find_paginas
    @pagina = Pagina.find(params[:id])
  end

  def pagina_params
    params.require(:pagina).permit(:title, :description, :body, :author)
  end

end
