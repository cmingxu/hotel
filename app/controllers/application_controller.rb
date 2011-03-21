# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # AuthenticatedSystem must be included for RoleRequirement, and is provided by installing acts_as_authenticates and running 'script/generate authenticated account user'.
  helper :all # include all helpers, all the time
  include RoleRequirementSystem
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  
  alias logged_in? user_signed_in?
  validates_captcha

  # 默认的搜索条件
  def default_search_conditions
    {:per_page => Setting.default_per_page_size,:page => params[:page],:order => "id DESC"}
  end

 
end
