class RegistrationsController < ApplicationController
  prepend_before_filter :require_no_authentication, :only => [ :new, :create ]
  prepend_before_filter :authenticate_scope!, :only => [:edit, :update, :destroy]
  include Devise::Controllers::InternalHelpers
  validates_captcha

  # GET /resource/sign_in
  def new
    session[:invited_by] = params[:invited_by]
    build_resource
    render_with_scope :new
  end

  # POST /resource/sign_up
  def create
    unless captcha_validated?
      set_now_flash_message :alert,"验证码错误" 
      render_with_scope :new
    else
      build_resource
      resource.invited_by = session[:invited_by] if session[:invited_by]
      if resource.save
        session.delete(:invited_by)
        set_flash_message :notice, :signed_up
        sign_in_and_redirect(resource_name, resource)
      else
        render_with_scope :new
      end
    end
  end

  # GET /resource/edit
  def edit
    render_with_scope :edit
  end

  # PUT /resource
  def update
    if self.resource.update_with_password(params[resource_name])
      set_flash_message :notice, :updated
      redirect_to after_sign_in_path_for(self.resource)
    else
      render_with_scope :edit
    end
  end

  # DELETE /resource
  def destroy
    self.resource.destroy
    set_flash_message :notice, :destroyed
    sign_out_and_redirect(self.resource)
  end

  protected

  # Authenticates the current scope and dup the resource
  def authenticate_scope!
    send(:"authenticate_#{resource_name}!")
    self.resource = send(:"current_#{resource_name}").dup
  end
end
