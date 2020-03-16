class V1::UsersController< ApplicationController

  def index
    respond_to do |format|
    format.json do 
      users = User.all      
      render(json: users, status: :ok)
    end 
  end
end
end