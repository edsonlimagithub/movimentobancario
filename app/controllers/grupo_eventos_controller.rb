class GrupoEventosController < ApplicationController
  # GET /grupo_eventos
  # GET /grupo_eventos.json
  def index
    @grupo_eventos = GrupoEvento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @grupo_eventos }
    end
  end

  # GET /grupo_eventos/1
  # GET /grupo_eventos/1.json
  def show
    @grupo_evento = GrupoEvento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @grupo_evento }
    end
  end

  # GET /grupo_eventos/new
  # GET /grupo_eventos/new.json
  def new
    @grupo_evento = GrupoEvento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @grupo_evento }
    end
  end

  # GET /grupo_eventos/1/edit
  def edit
    @grupo_evento = GrupoEvento.find(params[:id])
  end

  # POST /grupo_eventos
  # POST /grupo_eventos.json
  def create
    @grupo_evento = GrupoEvento.new(params[:grupo_evento])

    respond_to do |format|
      if @grupo_evento.save
        format.html { redirect_to @grupo_evento, notice: 'Grupo evento was successfully created.' }
        format.json { render json: @grupo_evento, status: :created, location: @grupo_evento }
      else
        format.html { render action: "new" }
        format.json { render json: @grupo_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /grupo_eventos/1
  # PUT /grupo_eventos/1.json
  def update
    @grupo_evento = GrupoEvento.find(params[:id])

    respond_to do |format|
      if @grupo_evento.update_attributes(params[:grupo_evento])
        format.html { redirect_to @grupo_evento, notice: 'Grupo evento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @grupo_evento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grupo_eventos/1
  # DELETE /grupo_eventos/1.json
  def destroy
    @grupo_evento = GrupoEvento.find(params[:id])
    @grupo_evento.destroy

    respond_to do |format|
      format.html { redirect_to grupo_eventos_url }
      format.json { head :no_content }
    end
  end
end
