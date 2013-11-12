#encoding:utf-8
class BoardDocumentsController < ApplicationController
  # GET /board_documents
  # GET /board_documents.json
  def index
    @board_documents = BoardDocument.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @board_documents }
    end
  end

  # GET /board_documents/1
  # GET /board_documents/1.json
  
  prawnto :prawn => {:page_size   => "A4", :margin => [75, 75]} 
  
  def show
    @board_document = BoardDocument.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board_document }
      format.pdf { render :layout=>false }
    end
  end

  # GET /board_documents/new
  # GET /board_documents/new.json
  def new
    @board_document = BoardDocument.new
    
   
    
    @project = Project.find(params[:id])
    
    
    #@board_member = BoardMember.find_all_by_project_id(@project.id)
    #board_member = BoardMember.find(1)
    
    #board_member = @board_document.board_members.build
    #board_member.nome = "ssssss"
    @board_document.project_id= @project.id
    @board_document.date=@project.board_date
    @universidade = "Universidade Federal do ABC (UFABC)"

    
    if @project.board_location != ""
      @universidade = @project.board_location
    end
    
   
      
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @board_document }
    end
  end

  # GET /board_documents/1/edit
  def edit
     @universidade = "Universidade Federal do ABC (UFABC)"

    
   
    
    @board_document = BoardDocument.find(params[:id])
    @project = Project.find(@board_document.project_id)
     if @project.board_location != ""
      @universidade = @project.board_location
    end
  end


  # POST /board_documents
  # POST /board_documents.json
  def create
    @board_document = BoardDocument.new(params[:board_document])

    respond_to do |format|
    
       
      if @board_document.save
        
       @project = Project.find(@board_document.project_id)
       @project.status = -5
       @project.save

        @members = BoardMember.find_all_by_project_id(@project.id)
        @members.each do |member|
          #UserMailer.confirmar_ata(member, @project)
        end
        
     
    
        format.html { redirect_to resumo_board_member_path(@board_document), notice: 'Ata enviada com sucesso.' }
        format.json { render json: @board_document, status: :created, location: @board_document }
      else
        format.html { render action: "new" }
        format.json { render json: @board_document.errors, status: :unprocessable_entity }
      end  
    end
  end
  
  def resumo
    @board_document = BoardDocument.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board_document }
    end
  end
  
    def atamanual
    @board_document = BoardDocument.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board_document }
      format.pdf { render :layout=>false }
    end
  end
  
  def enviaata
    @board_document = BoardDocument.find(params[:id])
    @board_document.update_attributes(params[:board_document])
      
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @board_document }
     
    end
  end
  
  
  def atadigital
    @board_document = BoardDocument.find(params[:id])
    @board_document.update_attributes(params[:board_document])
     
     respond_to do |format|
      format.html { redirect_to "/pgc/atamanual", notice: 'Ata enviada com sucesso.' }# show.html.erb
      format.json { render json: @board_document }
     
    end
    
    
  end
  
  # PUT /board_documents/1
  # PUT /board_documents/1.json
  def update
    @board_document = BoardDocument.find(params[:id])
     
     
     
     respond_to do |format|
    if @board_document.update_attributes(params[:board_document])
      
      
       #ata automatica
       if @board_document.tipo=="Automática"
       @project = Project.find(@board_document.project_id)
       @project.status = -5
       @project.save

        @members = BoardMember.find_all_by_project_id(@project.id)
        @members.each do |member|
          UserMailer.confirmar_ata(member, @project)
        end
        
     
    
        format.html { redirect_to resumo_board_document_path(@board_document), notice: 'Ata enviada com sucesso.' }
        format.json { render json: @board_document, status: :created, location: @board_document }

        #fim ata automatica
        
        #ata manual
        else
        if @board_document.tipo=="Manual"
          @project = Project.find(@board_document.project_id)
          @project.status = 5
          @project.save

             if @board_document.atadigital_file_name != nil
               @project.status = 6      
               @project.save
               
               format.html {redirect_to projects_path, notice: 'Ata enviada com sucesso.' }
               format.json { render json: @board_document, status: :created, location: @board_document }
               
               
             else
          
        format.html { redirect_to atamanual_board_document_path(@board_document), notice: 'Ata gerada com sucesso.' }
        format.json { render json: @board_document, status: :created, location: @board_document }
             end
        end
        end
           #fim ata manual
      else
        format.html { render action: "edit" }
        format.json { render json: @board_document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /board_documents/1
  # DELETE /board_documents/1.json
  def destroy
    @board_document = BoardDocument.find(params[:id])
    @board_document.destroy

    respond_to do |format|
      format.html { redirect_to board_documents_url }
      format.json { head :no_content }
    end
  end
end
