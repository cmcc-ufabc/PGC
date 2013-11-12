#encoding:utf-8

class MembersController < ApplicationController
  # GET /members
  # GET /members.json
  def index
    @members = Member.all
    @projects = Project.find_all_by_aluno_id(current_user.id)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end

  # GET /members/1
  # GET /members/1.json
  def show
    @member = Member.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
  end

  def aviso
      @member = Member.find(params[:member_id])
      UserMailer.adicionado_membro(@member).deliver
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @member }
    end
    
  end
  
  def confirma
    @member = Member.find(params[:id])
    
    if @member.token == params[:token]
    @member.confirmed = true
    @member.save
    else
    @member.confirmed = false
    end
    verifica(@member.project_id)
  end
  
  
  def salvar
    @project = Project.find(params[:id])
    
    @project.group_confirm = 1
    @project.save
    if !verifica(@project.id)
      respond_to do |format|
        format.html {redirect_to projects_path, :notice => "Membros salvos com sucesso"} 
        format.json { render json: @member }
      end
    end
  end
  
  #verifica se todos confirmaram
  def verifica (project_id)
   @project = Project.find(project_id)
   if @project.group_confirm
    @members = Member.find_all_by_project_id(@project.id)
   
    for member in @members
     if !member.confirmed
        return 
     else
       @project.status = 0
      
     end
    end
    
    @project.save
    UserMailer.pedido_orientacao(User.find_by_id(@project.orientador_id)).deliver
    #projeto confirmado
    if user_signed_in? 

      if current_user.role == "Aluno"
        respond_to do |format|
          format.html {redirect_to projects_path} 
          format.json { render json: @member }
        end
        return true
      end
    end
    
   else
     #projeto nao salvo pelo lider
     return false
   end
    
  end
  
  def manage
    
    @project = Project.find(params[:id])
    @members =  Member.find_all_by_project_id(@project.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @members }
    end
  end
  
  # GET /members/new
  # GET /members/new.json
  def new
    @member = Member.new
    @project = Project.find(params[:project_id])
 
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @member }
    end
  end

  # GET /members/1/edit
  def edit
    @member = Member.find(params[:id])
  end

  # POST /members
  # POST /members.json
  def create
    @member = Member.new(params[:member])

    @member.token = Digest::SHA1.hexdigest Time.now.to_s
    
 
    respond_to do |format|
      if @member.save
        format.html { redirect_to member_aviso_path(@member.id) }
        format.json { render json: @member, status: :created, location: @member }
      else
        format.html { render action: "new" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /members/1
  # PUT /members/1.json
  def update
    @member = Member.find(params[:id])

    respond_to do |format|
      if @member.update_attributes(params[:member])
        format.html { redirect_to @member, notice: 'Membro atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /members/1
  # DELETE /members/1.json
  def destroy
    @member = Member.find(params[:id])
    @member.destroy

    respond_to do |format|
      format.html { redirect_to members_url }
      format.json { head :no_content }
    end
  end
end
