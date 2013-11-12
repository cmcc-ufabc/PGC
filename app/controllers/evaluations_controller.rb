#encoding:utf-8
class EvaluationsController < ApplicationController
  # GET /evaluations
  # GET /evaluations.json
  def index
    @evaluations = Evaluation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @evaluations }
    end
  end

  # GET /evaluations/1
  # GET /evaluations/1.json
  def show
    @evaluation = Evaluation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @evaluation }
      format.pdf { render :layout=>false }
    end
  end

  # GET /evaluations/new
  # GET /evaluations/new.json
  def new
    

     @evaluation = Evaluation.new
     @evaluation.project_id=params[:id]
     
     # @project = Project.find(params[:id])
      #@project.status = 3
      #@project.save
  
 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @evaluation }
    end

  end

    prawnto :prawn => {:page_size   => "A4", :margin => [75, 75]} 
    
  # GET /evaluations/1/edit
  def edit
    @evaluation = Evaluation.find(params[:id])
  end

  # POST /evaluations
  # POST /evaluations.json
  def create
    @evaluation = Evaluation.new(params[:evaluation])

    respond_to do |format|
      if @evaluation.save
        
        #editado
        @project = Project.find(@evaluation.project_id)
        @project.status = 3
        @project.save
        #editado
      
      
        #adicionar orientador a banca
        @orientador = User.find(@project.orientador_id)
        
        @board_member = BoardMember.new(:nome => @orientador.name, :email => @orientador.email, :instituicao => @orientador.location, :tipo => "Presidente da Banca", :project_id =>@project.id, :confirmed => 0)
        @board_member.token = Digest::SHA1.hexdigest Time.now.to_s
        @board_member.save
        
        format.html { redirect_to @evaluation, notice: 'Avaliacao realizada com sucesso.' }
        format.json { render json: @evaluation, status: :created, location: @evaluation }
      else
        format.html { render action: "new" }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /evaluations/1
  # PUT /evaluations/1.json
  def update
    @evaluation = Evaluation.find(params[:id])

    respond_to do |format|
      if @evaluation.update_attributes(params[:evaluation])
        format.html { redirect_to @evaluation, notice: 'Avaliacao atualizada com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @evaluation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluations/1
  # DELETE /evaluations/1.json
  def destroy
    @evaluation = Evaluation.find(params[:id])
    @evaluation.destroy

    respond_to do |format|
      format.html { redirect_to evaluations_url }
      format.json { head :no_content }
    end
  end
end
