class HairsController < ApplicationController
  def index
    @users = User.all
    @owner = @users[0]
    @karutes = Hair.all.page(params[:page]).per(5)
  end

  def karute
    @karutes = Hair.all
  end

  def new
    @user = Hair.new
    @users = User.find(params[:id])
  end

  def create
    @user = Hair.new(karute_params)
    if @user.save
      redirect_to user_path(@user.user_id)
    else
      redirect_to hair_path(@user.user_id)
    end

  end

  def karute_params
    params.require(:hair).permit(:image1, :image2, :image3, :image4, :day, :menber, :money, :menu, :memo1, :memo2, :category ,:user_id)
  end

end
