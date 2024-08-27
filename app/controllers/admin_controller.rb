# app/controllers/admin_controller.rb
class AdminController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def new_user
    @user = User.new
  end

  def create_user
    @user = User.new(user_params)
    temporary_password = SecureRandom.hex(8)
    @user.password = temporary_password
    @user.password_confirmation = temporary_password

    if @user.save
      UserMailer.welcome_email(@user, temporary_password).deliver_now
      respond_to do |format|
        format.html { redirect_to root_path, notice: "Usuário criado com sucesso." }
        format.turbo_stream
      end
    else
      render :new_user
    end
  end

  private

  def authorize_admin
    redirect_to root_path, alert: 'Acesso negado!' unless current_user.admin?
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :role, departamento_id: [])
  end
end
