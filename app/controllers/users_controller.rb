class UsersController < ApplicationController
#  before_filter :authenticate_user!, :expect=> [:show]
  
  # 用户主页, 这里可以显示用户的修改昵称/上传图片等form
  def home
    @user = current_user
  end
  
  def show
  end

  # 我邀请了谁
  def invites
  end

  # 修改用户信息
  def update
    @user = current_user
    if  @user.update_attributes(params[:user])
      flash[:notice] = '信息更新成功'
    else
      flash[:notice] = '信息更新失败'
    end
    redirect_to dashboard_path
  end

  def credits
  end

  def points
  end

  # 用户充值
  def iwantcharge 
    redirect_to  pay_request_url(params[:credit].to_i)
  end

  # 充值
  def charge
  end

  # 支付宝回访通知地址
  def notify_credit
    notification = Alipay::Notification.new(request.raw_post)
    user = User.find(notification.order)
    # 钱少了也不算支付成功

    if notification.acknowledge && notification.complete? 
      user.adjust_credit(notification.amount,"客户充值#{notification.amount}元 ")
      PAYMENT_LOG.info "[CREDIT SUCCESS]"
      render :text => "success"
    else
      PAYMENT_LOG.info "[CREDIT FAILED]"
      render :text => "fail"
    end
  end



  # private

  def pay_request_url(amount)
    request_url = Alipay::Helper.new(current_user.id,Alipay::ACCOUNT,
                                     :amount =>amount ) do |service| 
      service.total_fee amount
      service.seller :email => Alipay::EMAIL.to_s
      service.notify_url  expand_request_path(notify_credit_admin_user_url(current_user))
      service.return_url  expand_request_path(credits_url)
      service.show_url  expand_request_path(credits_url)
      service.body "账户充值#{amount}"
      service.charset "utf-8" 
      service.service Alipay::CREATE_DIRECT_PAY_BY_USER 
      service.payment_type 1 
      service.subject "账户充值#{amount}"
      service.sign
                                     end
    Alipay.service_url + "?" +  request_url.to_request_query
  end

  def expand_request_path(uri)
    #"http://" + Setting.domain_name + uri
    uri
  end




end
