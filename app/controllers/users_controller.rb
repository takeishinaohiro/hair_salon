class UsersController < ApplicationController
  # before_action :move_to_index, except: [:search]
  def new
    @user = User.new
  end
  def index
    @users = User.all.page(params[:page]).per(2)

  end
  def create
    user_params[:birthday] = birthday_join
    @user = User.new(user_params)
    if @user.save!
      redirect_to users_path
    else
      redirect_to new_user_path
    end
  end

  def show
    @user = User.find(params.permit(:id).values[0])
    @karutes = Hair.where(user_id: @user)
  end

  def edit
    @karute = Hair.find(params.permit(:id).values[0])
  end


  def open
    @karute = Hair.find(params.permit(:id).values[0])
  end

  def search
    @users = User.search(params[:search])
  end

private

  def user_params
    params.require(:user).permit(:name1, :name2, :read_name1, :read_name2, :birthday, :tel, :station, :magazine, :rash)
  end

  def birthday_join
    year = params["birthday(1i)"]
    month = params["birthday(2i)"]
    day = params["birthday(3i)"]
    birthday = year.to_s + "-" + month.to_s + "-" + day.to_s
    return birthday
  end

end
