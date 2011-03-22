class CartsController < ApplicationController
  layout "cart"
  
  def show
    @pt = "我的购物车"
  end

  def create
    @product = Product.find(params[:product_id])
    @style = Style.find(params[:style_id])
    if @style.inventory_count < params[:quantity].to_i
      redirect_to "/showinfo?type=sold_out"
      return
    end
    cart = session[:cart] || Cart.new
    cart.add(params[:product_id],params[:quantity].to_i,params[:deal],params[:style_id])
    session[:cart] = cart unless session[:cart]
    redirect_to cart_path
  end
  
  # 前端需要参数style_id 和count
  def change_count
    session[:cart].change_count(params[:style_id],params[:count])
    respond_to do |format|
      format.js  { render :template => "/carts/update_cart.js.erb"}
    end
  end

  def destroy
    session.delete(:cart)
    redirect_to cart_path
  end

  def remove_line_item
    session[:cart].remove(params[:style_id]) if session[:cart]
    redirect_to cart_path
  end
  
end
