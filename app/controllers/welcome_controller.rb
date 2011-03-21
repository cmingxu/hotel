class WelcomeController < ApplicationController
  
  def index
    @xurl = "http://www.jumaimai.com"
    @xtitle = "一个叫聚买卖的商城，所有东西都能团购...你注册我就有积分..."
    @xcont = "http://www.jumaimai.com | 一个叫聚买卖的商城，所有东西都能团购...你注册我就有积分..."
  end

  def reset_session #insub 这个是干嘛用的?
   request.reset_session
  end

  def checkemail
    @user = User.find_by_email(params[:user_email])
    if @user
      render :text => "0"
    else
      render :text => "1"
    end
  end
  
  def search
    @products = Product.title_like_all(params[:keywords].to_s.split).all
    @brands = Brand.name_like_all(params[:keywords].to_s.split).all
  end
  
end
