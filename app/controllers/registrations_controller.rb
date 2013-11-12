class RegistrationsController < Devise::RegistrationsController
   
      def confirm
        
      end  
      
   protected
      def after_sign_up_path_for(resource)
        "http://google.com"
      end    
       def after_inactive_sign_up_path_for(resource)
        "/pgc/confirm" 
      end    
        
 
end