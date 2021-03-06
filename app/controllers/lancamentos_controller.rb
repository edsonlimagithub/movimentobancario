class LancamentosController < ApplicationController
  # GET /lancamentos
  # GET /lancamentos.json
  def index
    dataInicial = DateTime.strptime(params[:dataInicial], "%d/%m/%Y").to_s(:db)
    dataFinal = DateTime.strptime(params[:dataFinal], "%d/%m/%Y").to_s(:db)
    lancamentos = Lancamento.find(:all, :conditions => ["data < ? AND conta_id = ?", dataInicial, params[:contaId][0]])
    
    @saldo_inicial = 0

    lancamentos.each do |lancamento|
      if lancamento.evento.debito
        @saldo_inicial = @saldo_inicial - lancamento.valor
      else
        @saldo_inicial = @saldo_inicial + lancamento.valor
      end
    end

    @lancamentos = Lancamento.find(:all, 
      :conditions => ["conta_id = ? AND data BETWEEN ? AND ?", params[:contaId][0], dataInicial, dataFinal])

    saldo = @saldo_inicial

    @lancamentos.each_with_index do |lancamento, i|
      if lancamento.evento.debito
        saldo = saldo - lancamento.valor
      else
        saldo = saldo + lancamento.valor
      end
      @lancamentos[i][:saldo] = saldo
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lancamentos }
    end
  end

  # GET /lancamentos/1
  # GET /lancamentos/1.json
  def show
    @lancamento = Lancamento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lancamento }
    end
  end

  # GET /lancamentos/new
  # GET /lancamentos/new.json
  def new
    @lancamento = Lancamento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lancamento }
    end
  end

  # GET /lancamentos/1/edit
  def edit
    @lancamento = Lancamento.find(params[:id])
  end

  # POST /lancamentos
  # POST /lancamentos.json
  def create
    @lancamento = Lancamento.new(params[:lancamento])

    respond_to do |format|
      if @lancamento.save
        format.html { redirect_to @lancamento, notice: 'Lancamento was successfully created.' }
        format.json { render json: @lancamento, status: :created, location: @lancamento }
      else
        format.html { render action: "new" }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lancamentos/1
  # PUT /lancamentos/1.json
  def update
    @lancamento = Lancamento.find(params[:id])

    respond_to do |format|
      if @lancamento.update_attributes(params[:lancamento])
        format.html { redirect_to @lancamento, notice: 'Lancamento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lancamento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lancamentos/1
  # DELETE /lancamentos/1.json
  def destroy
    @lancamento = Lancamento.find(params[:id])
    @lancamento.destroy

    respond_to do |format|
      format.html { redirect_to lancamentos_url }
      format.json { head :no_content }
    end
  end

  def apagar_lancamento
    lancamento = Lancamento.find params[:id]
    if lancamento.destroy
      render :text => true
    else
      render :text => false
    end
  end

  def confirmado
    lancamento = Lancamento.find(params[:id])
    if lancamento.confirmado
      lancamento.confirmado = false
    else
      lancamento.confirmado = true
    end
    lancamento.save

    render :nothing => true
  end

  def filtro
  end

end
