#encoding:utf-8
module ApplicationHelper
  
  
  def data()
    @periodos = Duedate.find(:all, :conditions => ['orientation_start <= ? AND orientation_end >= ?', Date.today, Date.today])
    @periodo = @periodos[0]
    @periodo
  end
  def bdfile_projeto(id)
   
    @bdo = BoardDocument.find_by_project_id(id).atadigital.url
    @bdo
  end
  
  def board_auto(id)
    @board_document = BoardDocument.find_by_project_id(id)
 
    if @board_document.tipo == "Automática"
      
      return true
    else
      return false
    end
     
  end
  

  
  
  def id_do_board(id)
    BoardDocument.find_by_project_id(id).id
    
    
  end
  def retorna_bd_do_projeto(id)
   
    @ide = BoardDocument.find_by_project_id(id).id
    @ide
  end
  
  #retorna nome do aluno pelo id do projeto
  def aluno_projeto(id)
    
    @projeto = Project.find_by_id(id)
    
    @aluno = User.find_by_id(@projeto.aluno_id)
    @aluno.name
  end
  
  
   def orientador_projeto(id)
    
    @projeto = Project.find_by_id(id)
    
    @orientador = User.find_by_id(@projeto.orientador_id)
    @orientador.name
  end
  
  def titulo_projeto(id)
    
    @projeto = Project.find_by_id(id)
    @projeto.title
  end
  
   def board_projeto(id)
    
    
    
    @membros = BoardMember.find_all_by_project_id(id)
    
    @banca ="" 
    @membros.each do |membro|
    
    @banca += membro.nome + " ("+ membro.instituicao+"), "
    
    end
    @banca.chomp(", ")
  end
  
  def assinaturas(id)
    
    
    
    @membros = BoardMember.find_all_by_project_id(id)
    
    @banca ="________________________________________\n" 
    @membros.each do |membro|
    
    @banca += membro.nome + " \n\n________________________________________\n"
    
    end
   @banca.chomp("________________________________________\n")
  end
  
  
  def projeto_by_aluno(id)
    
  @aluno = User.find_by_id(id)
  @projetos = Project.find_all_by_aluno_id(@aluno.id)
  @projetos
  end
  
  def projeto_by_orientador(id)
    
  @orientador = User.find_by_id(id)
  @projetos = Project.find_all_by_orientador_id(@orientador.id)
  @projetos
  end
  
  
  def projetoover(projetos, status)
  
  
  for projeto in projetos
    
        if projeto.status >  status
          
          return true
        end
        
     end
  false
  
  end
  
  
  def existe_projeto_no_status(projetos, status)
  
  
  for projeto in projetos
    
        if projeto.status ==  status
          
          return true
        end
        
     end
  false
  
  end
  
  def existe_projeto_maior_que_status(projetos, status)
  
  
  for projeto in projetos
    
        if projeto.status >  status
          
          return true
        end
        
     end
  false
  
  end
  
  def coursearray(id)
  
  @aluno = User.find_by_id(id)
  @projetos = Project.find_all_by_aluno_id(@aluno.id)
  @pgc1 = 0
  @pgc2 = 0
  
  
  if @projetos == []
    
   @retorno = ["PGC I"]
    
  else
    
     for projeto in @projetos
    
        if projeto.course == "PGC I" && projeto.status == 5
          @pgc1 = 1
        elsif projeto.course == "PGC II" && projeto.status == 5
          @pgc2 = 1 
        end
        
     end
   
   if @pgc2 == 1
     
     @retorno = ["PGC I","PGC II","PGC III"]
   elsif @pgc1 ==1
     
     @retorno = ["PGC I","PGC II"]
   else
     
     @retorno = ["PGC I"]
   end     
    
  end
   
 end
    
 
  
  def disciplina_projeto(id)
    
    @projeto = Project.find_by_id(id)
    @projeto.course
    @msg = ""
    if @projeto.course == "PGC I"
      
    @msg = "Projeto de Graduacao em
Ciencia da Computacao I"
    elsif @projeto.course == "PGC II"
      
       @msg = "Projeto de Graduacao em
Ciencia da Computacao II"
    
    elsif @projeto.course == "PGC III"
      
       @msg = "Projeto de Graduacao em
Ciencia da Computacao III"
      end
    
   
    
  end
  
  def retorna_nome(id)
  @usuario=User.find_by_id(id)
  @usuario.name
end


  def retorna_aluno_por_avalicao(id)
      @projeto = Project.find_by_id(id)
      retorna_nome(@projeto.aluno_id)
      
    
  end
  def retorna_avaliacao(id)
    @avalia=Evaluation.find_by_project_id(id)
    
    
    if @avalia != nil

    @avalia.id
    else
    0
    end
  end
  
  def retorna_ata(id)
    @ata=BoardDocument.find_by_project_id(id)
    
    
    if @ata != nil

    @ata.id
    else
    0
    end
  
  end
  
  def retorna_status(status)
  @msg = "Desconhecido"
  
  if status == 0
    
     @msg = "Aguardando aprovação orientador"
  elsif status == 1
    
    @msg = "Aguardando aprovação coordenador"
  
  elsif status == 2
    
    @msg = "Aguardando avaliação parcial do orientador"
    
  elsif status == 3
    
    @msg = "Aguardando definição da banca"
  
  elsif status == 4
    
    @msg = "Aguardando ata final"
  
  elsif status == 5
  
     @msg = "Aguardando envio da ata"
     
  elsif status == 6
  
     @msg = "Projeto concluido"
     
     
  elsif status == -1
    
    @msg = "Recusado pelo orientador"
    
  elsif status == -2
    
    @msg = "Recusado pelo coordenador"
  elsif status == -4
    
    @msg = "Aguardando avaliaçao do projeto"
  
  elsif status == -5
    
    @msg = "Aguardando aprovação da ata pelos membros da banca"
  
  
  elsif status == -3
    
    @msg = "Aguardando confirmação dos membros do grupo"
  end
  
  @msg
  end
end
