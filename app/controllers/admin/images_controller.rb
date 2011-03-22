class Admin::ImagesController < Admin::BaseController
  def index
    @images = Image.site_images
  end

  def create
    @image = Image.new
    @image.icon = params[:pic]
    @image.owner_type= params[:owner_type] || "Site"
    @image.owner_id = params[:owner_id]  if params[:owner_id]
    respond_to do |format|
      if @image.save
        flash[:notice] = "上传成功"
        format.html { redirect_to admin_images_path}
      else
        flash[:notice] = "上传失败"
        format.html { redirect_to admin_images_path}
      end
    end

  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end


  def update
    @image = Image.find(params[:id])
    respond_to do |format|
      if @image.update_attributes(:data => params[:image][:pic])
        format.html { redirect_to edit_admin_image_path(@image)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { head :ok }
      end
    end
  end

end
