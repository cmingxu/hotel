class Admin::ImagesController < Admin::BaseController
  require_role ["admin","seller"]
  
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