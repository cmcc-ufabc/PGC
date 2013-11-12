class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, 
         :recoverable, :rememberable, :trackable, :validatable#, :confirmable
  
  validates_size_of :ra, :is => 8, :if => :eh_aluno?
  validates_uniqueness_of :ra, :if => :eh_aluno?
  
  def eh_aluno?
    role == 'Aluno'
  end



  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role, :location, :ra
  # attr_accessible :title, :body
end
