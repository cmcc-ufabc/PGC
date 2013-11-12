#encoding:utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery

    
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
