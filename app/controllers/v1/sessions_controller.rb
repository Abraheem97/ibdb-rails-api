class V1::SessionsController < ApplicationController 
  
  skip_before_action :verify_authenticity_token
  def create
    user = User.where(email: params[:email]).first
    

    if user&.confirmed_at == nil 
      render json: { error: true, message: 'Please confirm your registered email to access your account.'}, 
          status: 403
    else 
    if user&.valid_password?(params[:password])    
      render json: user.as_json(), status: :ok 
     
    else
       render json: { error: true, message: 'Please confirm your registered email to access your account.'}, 
          status: 401
         
  
    end
    
    end
  end
   


  def destroy 
    puts "==============" + params[:id]
      user = User.where(id: params[:id]).first
      user&.authentication_token = nil
      if user&.save
        head(:ok)
      else
        head(:unauthorized)
      end
  end

end