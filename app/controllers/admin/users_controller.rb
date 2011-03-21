class Admin::UsersController < Admin::BaseController
  layout "admin"
  
  # GET /users
  # GET /users.xml
  def index
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
    end
  end

  # GET /users/1
  # GET /users/1.xml
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end
  end

  def make_admin
    @user = User.find(params[:id])
    if @user.admin? and User.admin_count > 1
      @user.role = "user"
    else
      @user.role = "admin"
    end
    @user.save
    redirect_to admin_users_path

  end


end
