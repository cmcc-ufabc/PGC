class Project < ActiveRecord::Base
  attr_accessible :aluno_id, :board_id, :course, :description, :evaluation_id, :orientador_id, :pdf, :status, :title, :observation, :board_member1, :board_member2, 
  :board_member3, :board_member4, :board_member5, :member1_location, :member2_location, :member3_location, :member4_location, :member5_location, :member6_location ,
  :board_member6, :board_date, :boad_time, :board_location, :boad_invitation, :file, :groupstate, :duedate_id
  
  
  has_attached_file :file
  
  #validates_length_of :description, :maximum => 512
end
