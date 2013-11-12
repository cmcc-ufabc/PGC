#encoding:utf-8
class BoardMembersController < ApplicationController
  # GET /board_members
  # GET /board_members.json
  def index
    @board_members = BoardMember.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @board_members }
    end
  end

  # GET /board_members/1
  # GET /board_members/1.json
  def show
    @board_member = BoardMember.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board_member }
    end
  end

  # GET /board_members/new
  # GET /board_members/new.json
  def new
    
    
    
 
     
        
    @board_member = BoardMember.new
    @projeto= params[:project_id]
    
  
     
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @board_member }
    end
  end

  # GET /board_members/1/edit
  def edit
    @board_member = BoardMember.find(params[:id])
    @projeto= params[:project_id]
  end


  
  
  
  def selectmember
    
        @board_document = BoardDocument.find(params[:id])
        @board_members = BoardMember.find_all_by_project_id(@board_document.project_id)
      
  end
  
  # POST /board_members
  # POST /board_members.json
  def create
    @board_member = BoardMember.new(params[:board_member])
    @board_member.confirmed = 0;
    @board_member.token = Digest::SHA1.hexdigest Time.now.to_s
    if @board_member.tipo=="Presidente da Banca" || @board_member.tipo=="Titular"
      @board_member.selected = 1
    else
      @board_member.selected = 0
    end
    respond_to do |format|
      if @board_member.save
        
        
       
        
        format.html { redirect_to novabanca_path(:id => @board_member.project_id), notice: 'Membro da banca adicionado com sucesso.' }
        format.json { render json: @board_member, status: :created, location: @board_member }
      else
        format.html { render action: "new" }
        format.json { render json: @board_member.errors, status: :unprocessable_entity }
      end
    end
  end


  def confirma
    @member = BoardMember.find(params[:id])
    
    if @member.token == params[:token]
      @member.confirmed = true
      @member.save
      verifica(@member)
    else
      @member.confirmed = false
    end
  end
  
  
    def verifica (member)
    @member = member
    @project = Project.find(@member.project_id)
    @members = BoardMember.find_all_by_project_id(@member.project_id)
    
      for member in @members
        if !member.confirmed
          return 
        else
         @project.status = 6
       
        end
      end
    
    @project.ata_confirm = 1
    @project.save
    #membros confirmaram ata
     

  end
  # PUT /board_members/1
  # PUT /board_members/1.json
  def update
    @board_member = BoardMember.find(params[:id])

    respond_to do |format|
      if @board_member.update_attributes(params[:board_member])
        format.html { redirect_to novabanca_path(:id => @board_member.project_id), notice: 'Membro da banca atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @board_member.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_members/1
  # DELETE /board_members/1.json
  def destroy
    @board_member = BoardMember.find(params[:id])
    @board_member.destroy

    respond_to do |format|
      format.html { redirect_to redirect_to novabanca_path(:id => @board_member.project_id) }
      format.json { head :no_content }
    end
  end
end
