#encoding:utf-8
class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  before_filter :authenticate_user!#, :except=>[:show]
  
  def index
    

    if current_user.role=="Aluno"
      @projects = Project.find_all_by_aluno_id(current_user.id)
    elsif current_user.role=="Orientador"
      @projects = Project.find_all_by_orientador_id(current_user.id)
    else
      @projects = Project.all
      
    end
  

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  



  def show
    @project = Project.find(params[:id])

    @grupos = []
    if @project.group_confirm
        @grupos = Member.find_all_by_project_id(@project.id)
        
    end
    
    
        @board_members = BoardMember.find_all_by_project_id(@project.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
    

    
  end


  def sendfile
    
        
    if current_user.role=="Aluno" 
      @projects= Project.find_all_by_aluno_id_and_status(current_user.id,5)
    
    else
      @projects = Project.all
    end

 
    respond_to do |format|
      format.html  #send.html.erb
      format.json { render json: @projects }
    end
  end
  
  def gerarata
    
      
  if current_user.role=="Orientador"
      @projects= Project.find_all_by_orientador_id_and_status(current_user.id,4)
      
   
    
    else
      @projects = Project.all
    end

 
    respond_to do |format|
      format.html  #gerarata.html.erb
      format.json { render json: @projects }
  end
  end
  
  

  def banca
    
      
  if current_user.role=="Orientador"
      
      @projects = Project.find_all_by_orientador_id(current_user.id)
      
    else
      @projects = Project.all
    end
 
    respond_to do |format|
      format.html # evaluate.html.erb
      format.json { render json: @projects }
  end
  end
  
   def editbanca
    @project = Project.find(params[:id])
    @board_members = BoardMember.find_all_by_project_id(@project.id)
    
   
  end
  
  
  
  def atamanual
    

      @projects= Project.find_all_by_status(5)
    
    
    respond_to do |format|
      format.html # atamanual.html.erb
      format.json { render json: @projects }
  end
  end
  
  
 
  def evaluate
    
      
  if current_user.role=="Orientador"
      @projects= Project.find_all_by_orientador_id_and_status(current_user.id,2)
    
    else
      @projects = Project.all
    end

 
    respond_to do |format|
      format.html # evaluate.html.erb
      format.json { render json: @projects }
  end
  end
  
  def accept
    
      
  if current_user.role=="Aluno"
      @projects = Project.find_all_by_aluno_id(current_user.id)
    elsif current_user.role=="Orientador"
      @projects= Project.find_all_by_orientador_id_and_status(current_user.id, 0)
    elsif current_user.role=="Coordenador"
      @projects= Project.find_all_by_status( 1)
    else
        @projects = Project.all
    end
 
      respond_to do |format|
      format.html # accept.html.erb
      format.json { render json: @projects }
  end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
   
    @project = Project.new
    @orientadores = User.find_all_by_role("Orientador")
    
    @periodos = Duedate.find(:all, :conditions => ['orientation_start <= ? AND orientation_end >= ?', Date.today, Date.today])
    @periodo = @periodos[0]
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
    
    
    

 
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
    @orientadores = User.find_all_by_role("Orientador")
  end


  def relatorio
    
    @periodos = Duedate.all
    
    respond_to do |format|
      format.html # new.html.erb
    
    end
    
  end
    
  def confirm
    @project = Project.find(params[:id])
    @orientadores = User.find_all_by_role("Orientador")
  end
  
  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
 
  
   
    respond_to do |format|
      if @project.save
        
        if @project.groupstate
       
        format.html { redirect_to manage_member_path(@project.id)  }
        format.json { render json: @project, status: :created, location: @project }
        
        else
        
        UserMailer.pedido_orientacao(User.find_by_id(@project.orientador_id)).deliver
        
        format.html { redirect_to edit_project_path(@project), notice: 'Projeto foi criado com sucesso.' }
        format.json { render json: @project, status: :created, location: @project }
        end
       
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
      
    end
    
     else
          
     
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        #format.html { redirect_to @project, notice: 'Projeto foi atualizado com successo.' }
        
        
        if @project.status == 1
         UserMailer.aprovado(User.find_by_id(@project.aluno_id), @project).deliver
        elsif @project.status == -1
          UserMailer.recusado(User.find_by_id(@project.aluno_id), @project).deliver
        elsif @project.status == 2
          UserMailer.aprovado(User.find_by_id(@project.aluno_id), @project).deliver
        elsif @project.status == -2
          UserMailer.recusado(User.find_by_id(@project.aluno_id), @project).deliver
        elsif @project.status == 4
          
         #codigo injetado boardDocuments
    

         @board_document = BoardDocument.new
         @board_document.project_id = @project.id       
         @board_document.save
         #fim
          
          if @project.boad_invitation
            
            @membros = BoardMember.find_all_by_project_id(@project.id)
            
            @membros.each do |m|
              
              UserMailer.convite_banca(m, @project).deliver
    
            end
          end
        end
        
        
        format.html { redirect_to projects_path}
        #format.html { render action: "edit" }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
