class LoginController < ApplicationController
  
  
  
  def confirm
    
      respond_to do |format|
      format.html # new.html.erb
      #format.json { render json: @project }
    end
  end
end
