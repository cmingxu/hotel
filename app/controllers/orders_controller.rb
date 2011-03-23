class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
  end

  def confirm
    @order = Order.find(params[:id])
    if @order.confirm!
      flash[:notice] = ' 确认订单成功'
    else
      flash[:notice] = ' 订单确认失败'
    end

    redirect_to order_path(@order)
  end

  #  # 用户支付后的返回页面。 （也可以不返回 ，按照原型上来说是不返回的）
  def online_pay_result
    result = Alipay::Return.new(request.query_string)
    @order = Order.find(result.order)
    if result.success?
      flash[:notice] = "支付成功!"
    else
      logger.info request.query_string
      logger.warn result.message
      flash[:notice] = "支付失败!"
    end
  end

  # 支付宝回访通知地址
  def notify_result
    notification = Alipay::Notification.new(request.raw_post)
    @order = Order.find(notification.order)
    # 钱少了也不算支付成功

    if notification.acknowledge && notification.complete? && (notification.amount * 100).ceil >= (@order.total * 100).ceil
      @order.pay!
      PAYMENT_LOG.info "[SUCCESS]"
      render :text => "success"
    else
      PAYMENT_LOG.info "[FAILED]"
      render :text => "fail"
    end
  end



  # private

  def pay_request_url
    request_url = Alipay::Helper.new(@order.order_number,Alipay::ACCOUNT,
                                     :amount => @order.total_price) do |service| 
      service.total_fee @order.total_price 
      service.seller :email => Alipay::EMAIL.to_s
      service.notify_url  expand_request_path(notify_result_order_url(@order))
      service.return_url  expand_request_path(online_pay_result_order_url(@order))
      service.show_url  expand_request_path(order_url(@order))
      service.body @order.order_number
      service.charset "utf-8" 
      service.service Alipay::CREATE_DIRECT_PAY_BY_USER 
      service.payment_type 1 
      service.subject @order.order_number
      service.sign
                                     end
    Alipay.service_url + "?" +  request_url.to_request_query
  end

  def expand_request_path(uri)
    #"http://" + Setting.domain_name + uri
    uri
  end




end
