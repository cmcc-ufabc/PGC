#encoding:utf-8
class UserMailer < ActionMailer::Base
  default :from => "cmccbcc@gmail.com"
  
  include ApplicationHelper
  def email_de_teste(user)
    @user = user
 
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
  end

 def pedido_orientacao(user)
    @user = user
 
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Novo Pedido de Orientação")
  end

  def aprovado(user, project)
    @user = user
    @project = project
    @orientador = orientador_projeto(@project.id)
    
    if @project.status == 1
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Seu projeto foi aprovado pelo orientador")
    elsif @project.status == 2
    mail(:to => "#{user.name} <#{user.email}>", :subject => "Seu projeto foi aprovado pelo coordenador")
    end
    
  end

 def recusado(user, project)
    @user = user
    @project = project
    @orientador = orientador_projeto(@project.id)
    
    if @project.status == -1
      mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Seu projeto foi reprovado pelo orientador")
    elsif @project.status == -2
      mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Seu projeto foi reprovado pelo coordenador")
    end
  end
  
  
  def adicionado_membro(member)
    @member = member
    @project = Project.find(@member.project_id)
    @sender = retorna_nome(@project.aluno_id)
    @orientador = orientador_projeto(@project.id)
    
    mail(:to => "#{member.name} <#{member.email}>", :subject => "Confirmar participação em projeto de graduação")
  end



  def convite_banca(member, project)
    @member = member
    @project = project
    @sender = retorna_nome(@project.aluno_id)
    @orientador = orientador_projeto(@project.id)
   
    
  
    mail(:to => "#{member.nome} <#{member.email}>", :subject => "Confirmar Ata de defesa de projeto de graduação").deliver
    
    
  end
  

  
  def confirmar_ata(member, project)
    @member = member
    @project = project
    @sender = retorna_nome(@project.aluno_id)
    @orientador = orientador_projeto(@project.id)
    @document = BoardDocument.find_by_project_id(@project.id)
    
  
    mail(:to => "#{member.nome} <#{member.email}>", :subject => "Confirmar Ata de defesa de projeto de graduação").deliver
    
    
  end

end
