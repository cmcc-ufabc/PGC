#encoding:utf-8
class DuedatesController < ApplicationController
  # GET /duedates
  # GET /duedates.json
  def index
    @duedates = Duedate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @duedates }
    end
  end

  # GET /duedates/1
  # GET /duedates/1.json
  
  def show
    @duedate = Duedate.find(params[:id])


    @projetos = Project.find_all_by_duedate_id(@duedate.id)
    
    
    @tabelaConcluido = [["Nome", "RA", "Conceito"]]
    @tabelaPendente = [["Nome", "RA", "Status"]] 
    
    @projetos.each do |p|
      if p.status == 6
         @aluno = User.find_by_id(p.aluno_id)
         
         @board_document = BoardDocument.find_by_project_id(p.id)
         
         @linha = [  @aluno.name, @aluno.ra, @board_document.mark ]
         @tabelaConcluido.append(@linha)
      else
        @aluno = User.find_by_id(p.aluno_id)
        
        @linha = [ @aluno.name, @aluno.ra, retorna_status(p.status)]
        @tabelaPendente.append(@linha)
      end
    
      
    end
    
    if @tabelaConcluido == [["Nome", "RA", "Conceito"]]
         @tabelaConcluido = [["Nenhum Projeto Concluido"]]  
    end 
    if @tabelaPendente == [["Nome", "RA", "Status"]]
         @tabelaPendente = [["Nenhum Projeto Pendente"]]  
    end 

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @duedate }
      format.pdf { render :layout=>false }
    end
  end

  # GET /duedates/new
  # GET /duedates/new.json
  def new
    @duedate = Duedate.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @duedate }
    end
  end

  # GET /duedates/1/edit
  def edit
    @duedate = Duedate.find(params[:id])
  end

  # POST /duedates
  # POST /duedates.json
  def create
    @duedate = Duedate.new(params[:duedate])
    @duedate.finalizado = false;
    respond_to do |format|
      if @duedate.save
        format.html { redirect_to duedates_path(), notice: 'Duedate was successfully created.' }
        format.json { render json: @duedate, status: :created, location: @duedate }
      else
        format.html { render action: "new" }
        format.json { render json: @duedate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /duedates/1
  # PUT /duedates/1.json
  def update
    @duedate = Duedate.find(params[:id])

    respond_to do |format|
      if @duedate.update_attributes(params[:duedate])
        format.html { redirect_to @duedate, notice: 'Duedate was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @duedate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /duedates/1
  # DELETE /duedates/1.json
  def destroy
    @duedate = Duedate.find(params[:id])
    @duedate.destroy

    respond_to do |format|
      format.html { redirect_to duedates_url }
      format.json { head :no_content }
    end
  end
end
