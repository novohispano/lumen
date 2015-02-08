class Admin::SessionsController < Admin::AdminController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: user_params[:email])

    if user && user.authenticate(user_params[:password])
      session[:user_id] = user.id
      redirect_to admin_path
    else
      redirect_to admin_login_path, danger: 'Hubo un problema con tu cuenta. Verifica que tu email y tu password sean los correctos e intenta de nuevo.'
    end
  end

  def destroy
    session.clear

    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
