module CaptchaHelper
    
   def captcha_image(options = {})
      @captcha_image ||= CaptchaUtil::random_image
      "<span id='captcha_img' class='img'>" + image_tag('/system/captcha/' + @captcha_image, options) + "</span>"
   end
   
   def captcha_input_text(options = {:id => "mycode", :class=>"captcha"})
      @captcha_image ||= CaptchaUtil::random_image
      text_field_tag(:captcha, nil, options)
   end
   
   def captcha_hidden_text
      @captcha_image ||= CaptchaUtil::random_image
      hidden_field_tag(:captcha_validation, @captcha_image.gsub(/\..+$/,''))
   end
   
   def captcha_block
      html = ""
      html += captcha_input_text
      html += captcha_image
      html += captcha_hidden_text
   end
end