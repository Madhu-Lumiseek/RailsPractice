class UsersController < ApplicationController

  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(5)
  end

  def show
    # @user = User.find_by_id(params[:id])
  end

  def new
      @user = User.new
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
        redirect_to users_path, notice: "Updated User."
    else
        render :edit
    end
  end

  def create
    @user = User.create(user_params)
    if @user.save(validate: false)
        redirect_to users_path, notice: "User succesfully created!" 
    else
        render :new
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
