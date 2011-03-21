class Admin::StylesController < Admin::BaseController
  require_role "admin"
  
  def edit
    @style = Style.find(params[:id])
  end
  
  def update
    @style = Style.find(params[:id])
    @product = @style.product
    
    respond_to do |format|
      if @style.update_attributes(params[:style])
        format.html { redirect_to(admin_product_path(@product), :notice => 'Brand was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @style.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def create
    @product = Product.find(params[:product_id])
    @style = @product.styles.create(params[:style])
    redirect_to(admin_product_path(@product), :notice => 'Style was successfully created.')
  end

  def destroy
    @style = Style.find(params[:id])
    @product = @style.product
    redirect_to(admin_product_path(@product), :notice => 'last style,can not be deleted.') \
      if @product.styles.enabled.count == 1
    @style.destroy
    redirect_to(admin_product_path(@product), :notice => 'Style was successfully delete.')
  end
  
end
