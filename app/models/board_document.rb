class BoardDocument < ActiveRecord::Base
  attr_accessible :approval, :date, :location, :mark, :project_id, :time, :location2, :city, :tipo, :board_members_attributes, :atadigital
  has_many :board_members, :dependent => :destroy
  
  accepts_nested_attributes_for :board_members
  
  has_attached_file :atadigital
   
end
