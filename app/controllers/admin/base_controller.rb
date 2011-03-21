class Admin::BaseController < ApplicationController
  layout "admin"
  before_filter :authenticate_user!
  before_filter :admin_required

  #require_role "system_admin" 缺少only，, :expect=> [:show]等参数

  def index
  end
  def admin_required
    unless current_user && current_user.admin?
      flash[:notice]  = "无权限"
      redirect_to "/" 
    end
  end

end
