# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  # 当前用户是否有《角色》
  def has_role?(role)
    current_user.has_role?role
  end

  # 根据不同flash类型显示不同样式
  def show_flash
    html = ""
    ["message", "notice", "warning", "error"].each do |type|
      unless flash[type.intern].nil?
        html << content_tag("div", flash[type.intern].to_s, :id => type, :class => "flash")
      end
    end
    content_tag("div", html, :id => "flash")
  end
  
  def to_money(amt)
    sprintf("%0.2f", amt)
    # number_with_precision(111.2345, :precision => 1, :significant => true):format => "%u%n"
  end
  
  def to_split_money(amt)
    money = to_money(amt)
    money.to_s.split(".")[0] + '<span>.'+ money.to_s.split(".")[1] + '</span>'
  end

end
