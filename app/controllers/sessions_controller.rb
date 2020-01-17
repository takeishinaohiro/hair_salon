class SessionsController < ApplicationController
  skip_before_action :require_sign_in, only: [:login]
  skip_before_action :current_user, only: [:login]
  def login
      if params[:session]
          @user = User.find_by(name1: params[:session][:name1], name2: params[:session][:name2], tel: params[:session][:tel])
          if @user
              session[:user_id] = @user.id
              redirect_to root_path(session[:user_id])
          else
              render("sessions/login")
          end
      end
  end

  def destroy
      session.delete(:user_id)
      @current_user = nil
      redirect_to login_path
  end


  private 
  def session_params
      params.require(:session).permit(:name1,:name2,:tel)
  end
end
