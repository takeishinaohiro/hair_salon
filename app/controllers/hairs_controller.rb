class HairsController < ApplicationController
  def index
  end
  def show
    @users = User.all
  end
  def new
    @karute = User.new
    @user = User.find(params[:id])
  end
end
