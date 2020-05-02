class HairsController < ApplicationController
  def index
    @users = User.all
    @owner = @users[0]
    @karutes = Hair.all.page(params[:page]).per(5)
    @karute_current_user = current_user.hairs.all.page(params[:page]).per(5)
  end

  def karute
    @karutes = Hair.all
  end

  def new
    @user = Hair.new
    @users = User.find(params[:id])
  end

  def create
    karute_params[:day] = hair_day_join
    @user = Hair.new(karute_params)

    @user.valid?
    if @user.errors.messages.blank? && @user.errors.details.blank?
      create_session_hair(karute_params)
    else
      create_session_hair(karute_params)
      error_massages_hair(@user.errors)
      redirect_to hair_path(@user.user_id)
      return
    end

    if @user.save
      delete_session
      delete_errors
      redirect_to user_path(@user.user_id)
    else
      redirect_to hair_path(@user.user_id)
    end

  end

  def karute_params
    params.require(:hair).permit(:image1, :image2, :image3, :image4, :day, :menber, :money, :menu, :memo1, :memo2, :category ,:user_id)
  end

  def create_session_hair(karute_params)
    session[:image1] = karute_params[:image1],
    session[:image2] = karute_params[:image2],
    session[:image3] = karute_params[:image3],
    session[:image4] = karute_params[:image4],
    session[:day] = karute_params[:day],
    session[:menber] = karute_params[:menber],
    session[:money] = karute_params[:money],
    session[:menu] = karute_params[:menu],
    session[:memo1] = karute_params[:memo1],
    session[:memo2] = karute_params[:memo2],
    session[:category] = karute_params[:category],
    session[:user_id] = karute_params[:user_id]
  end

  def delete_session
    session.delete(:image1)
    session.delete(:image2)
    session.delete(:image3)
    session.delete(:image4)
    session.delete(:day)
    session.delete(:menber)
    session.delete(:money)
    session.delete(:menu)
    session.delete(:memo1)
    session.delete(:memo2)
    session.delete(:category)
  end

  def error_massages_hair(errors)
    session[:image1_error] = @user.errors.messages[:image1]
    session[:image2_error] = @user.errors.messages[:image2]
    session[:image3_error] = @user.errors.messages[:image3]
    session[:image4_error] = @user.errors.messages[:image4]
    session[:day_error] = @user.errors.messages[:day]
    session[:menber_error] = @user.errors.messages[:menber]
    session[:money_error] = @user.errors.messages[:money]
    session[:menu_error] = @user.errors.messages[:menu]
    session[:memo1_error] = @user.errors.messages[:memo1]
    session[:memo2_error] = @user.errors.messages[:memo2]
    session[:category_error] = @user.errors.messages[:category]
    session[:user_id_error] = @user.errors.messages[:user_id]
  end

  def delete_errors
    session.delete(:image1_error)
    session.delete(:image2_error)
    session.delete(:image3_error)
    session.delete(:image4_error)
    session.delete(:day_error)
    session.delete(:menber_error)
    session.delete(:money_error)
    session.delete(:menu_error)
    session.delete(:memo1_error)
    session.delete(:memo2_error)
    session.delete(:category_error)
    session.delete(:user_id_error)
  end

  def hair_day_join
    year = params["day(1i)"]
    month = params["day(2i)"]
    day = params["day(3i)"]
    hair_day = year.to_s + "-" + month.to_s + "-" + day.to_s
    return hair_day
  end




end