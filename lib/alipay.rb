require  'alipay/helper'
require  'alipay/notification'
require  'alipay/return'


module Alipay
  ACCOUNT = Setting.jmm_zhifubao_partnerid
  KEY = Setting.jmm_zhifubao_password
  SERVICE_URL = "https://www.alipay.com/cooperate/gateway.do"
  EMAIL = Setting.jmm_zhifubao_email
  CREATE_DIRECT_PAY_BY_USER = 'create_direct_pay_by_user'
  CREATE_PARTNER_TRADE_BY_BUYER = 'create_partner_trade_by_buyer'
  TRADE_CREATE_BY_BUYER = 'trade_create_by_buyer'

  def self.notification(post)
    Notification.new(post)
  end

  def self.return(query_string)
    Return.new(query_string)
  end

  def self.service_url
    SERVICE_URL
  end

  def self.notification_confirmation_url
    "http://notify.alipay.com/trade/notify_query.do?"
  end

end
