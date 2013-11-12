class Member < ActiveRecord::Base
  attr_accessible :confirmed, :email, :name, :token, :project_id
  
 
  
end
