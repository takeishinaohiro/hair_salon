class UsersController < ApplicationController
  # before_action :move_to_index, except: [:search]
  def new
    @user = User.new
  end
  def index
    @users = User.all

  end
  def create
    @user = User.new(user_params)
    if @user.save!
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end
  def user_params
    params.require(:user).permit(:name1, :name2, :read_name1, :read_name2, :tel, :birthday, :station, :magazine, :rash)
  end

  def show
    @user = User.find(params.permit(:id).values[0])
    @karutes = Hair.where(user_id: @user)
  end

  def edit
    @karute = Hair.find(params.permit(:id).values[0])
  end

  def search
    @tweets = User.search(params[:keyword])
  end
end
