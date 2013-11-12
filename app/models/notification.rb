class Notification < ActiveRecord::Base
  attr_accessible :author, :date, :details, :title
end
