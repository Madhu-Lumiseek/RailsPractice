class RegistrationsController < Devise::RegistrationsController
  
  def new
    super
  end

  def create
    @user = User.new(registration_params)
    if @user.valid?
        @user.save
            redirect_to user_session_path
    else
        render 'new'
    end
  end

  def registration_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
  
end
