class HairsController < ApplicationController
  def index

  end

  def karute
    @karutes = Hair.all
  end

  def new
    @karute = Hair.new
    @user = User.find(params[:id])
  end

  def create
    @user = Hair.new(karute_params)
    if @user.save
      redirect_to user_path(@user.user_id)
    end

  end

  def karute_params
    params.require(:hair).permit(:image1, :image2, :image3, :image4, :day, :menber, :money, :menu, :memo1, :memo2, :category, :user_id)
  end

end
