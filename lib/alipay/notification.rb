require 'net/http'
require 'alipay/sign'
 
module Alipay
  class Notification
    include Sign
    
    attr_accessor :params
    attr_accessor :raw
    
    def initialize(post, options = {})
       @options = options
       empty!
       parse(post)
       PAYMENT_LOG.info "=================notification from alipay==================" 
       PAYMENT_LOG.info @params
    end
    
    def gross_cents
        (gross.to_f * 100.0).round
    end
    
    # reset the notification.
    def empty!
      @params = Hash.new
      @raw = ""
    end
    
    
    def complete?
        if status != "TRADE_SUCCESS"
          return false
        end

        unless verify_sign
          @message = "Alipay Error: ILLEGAL_SIGN"
          return false
        end

      return true
    end
    
    def order
      @params["out_trade_no"]
    end

    def amount
      @params["total_fee"]
    end

    def message
      @message
    end

    def item_id
      params['']
    end

    def transaction_id
      params['']
    end
    
    # When was this payment received by the client.
    def received_at
      params['']
    end

    def payer_email
      params['']
    end

    def receiver_email
      params['']
    end

    def security_key
      params['']
    end

    # the money amount we received in X.2 decimal.
    def gross
      params['']
    end

    # Was this a test transaction?
    def test?
      params[''] == 'test'
    end

    def status
      params['trade_status']
    end


    def notify_id
      params["notify_id"]
    end
    
    # Acknowledge the transaction to Alipay. This method has to be called after a new
    # apc arrives. Alipay will verify that all the information we received are correct and will return a
    # ok or a fail.
    #
    # Example:
    #
    # def ipn
    # notify = AlipayNotification.new(request.raw_post)
    #
    # if notify.acknowledge
    # ... process order ... if notify.complete?
    # else
    # ... log possible hacking attempt ...
    # end
    def acknowledge
      payload = @raw
      noti_confirm = Alipay.notification_confirmation_url
      noti_confirm += ("partner=" + Alipay::ACCOUNT.to_s + "&notify_id=" + notify_id)
      PAYMENT_LOG.info "===============acknowledge init by jumaimai ============"
      PAYMENT_LOG.info noti_confirm 
      uri = URI.parse(noti_confirm)
      result = Net::HTTP.get(uri)
      PAYMENT_LOG.info "---------acknowledge result #{result} ----------------"
      result  == "true"
    end
    
    private

    # Take the posted data and move the relevant data into a hash
    def parse(post)
      @raw = post
      for line in post.split('&')
        key, value = *line.scan( %r{^(\w+)\=(.*)$} ).flatten
        params[key] = value
      end
    end
    
 end
end
