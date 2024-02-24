class Admin::UsersController < Admin::AdminController
  layout 'admin'
  skip_before_action :require_login, only: [:new, :create]

  def index
    @users = policy_scope(User)
    authorize @users
  end

  def new
    @user = User.new
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def create
    @user = User.new(user_params)
    authorize @user
    if @user.save
      flash[:notice] = "User created successfully"
      redirect_to admin_users_path
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to admin_users_url, notice: "User was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user.destroy!
    authorize @user
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: "User was successfully destroyed." }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, role_ids: [])
  end
end
