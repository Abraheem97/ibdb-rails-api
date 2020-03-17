class V1::UsersController< ApplicationController

  def index
    respond_to do |format|
    format.json do 
        
      user = User.find(params[:id])    
      render json: user, only: [:email], status: :ok
    end 
  end
end
end