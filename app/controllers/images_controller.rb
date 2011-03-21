class ImagesController < ApplicationController
  require_role ["admin","seller"]
  
  def create
    parent_object = params.find{|k,v| k=~ /(.*)_id/ && v =~ /\d/}
    key = parent_object[0]
    parent_object = parent_object.first.split("_")[0] rescue "product"
    parent_object = parent_object.titleize.constantize.find(params[key])
    @image  = parent_object.images.new(params[:image])
    if @image.save
      flash[:notice] = "图片创建成功"
    else
      flash[:notice] = '图片创建失败'
    end
    redirect_to send("admin_#{@image.holder_type.downcase}_path",@image.holder)
  end

  def destroy
    @image  = Image.find(params[:id])
    holder = @image.holder
    holder_type = @image.holder_type

    if @image.destroy
      flash[:notice] = "图片删除成功"
    else
      flash[:notice] = "图片删除失败"
    end
    redirect_to send("admin_#{holder_type.downcase}_path",holder)
  end


end
