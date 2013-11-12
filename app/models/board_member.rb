class BoardMember < ActiveRecord::Base
  attr_accessible :email, :instituicao, :nome, :tipo, :project_id, :confirmed, :token, :selected, :board_document_id
  
  belongs_to :board_document
end
