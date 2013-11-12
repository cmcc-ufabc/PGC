class Duedate < ActiveRecord::Base
  attr_accessible :board_end, :board_start, :evaluation_end, :evaluation_start, :orientation_end, :orientation_start, :trimestre, :finalizado
end
