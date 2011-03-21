class User < ActiveRecord::Base

  belongs_to :invitee,:class_name => "User",:foreign_key => "invited_by"
  has_many :invited_users,:class_name => "User",:foreign_key => "invited_by"

  ROLE = {"admin"       => "系统管理员",
          "user"        => "普通用户"
  }

  after_create :set_default


  #  限制authenication
  def valid_for_authentication?(attributes)
    !self.lock && self.valid_password?(attributes[:password])
  end


  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }

  devise :database_authenticatable, :registerable,   
    :recoverable, :rememberable, :trackable, :validatable#,:confirmable 

  # Setup accessible (or protected) attributes for your model  
  attr_accessible :email, :password, :password_confirmation ,:nick, :avatar 
#  attr_protected :user_type,:role

  def has_role?(role)
    self.role == role 
  end

  def self.admin_count
    self.count(:conditions => {:role => "admin"})
  end

  def admin?
    self.role == "admin"
  end

  def user?
    self.role == "user"
  end

  def login
    self.nick or self.email
  end

  # 调整积分
  def adjust_points(point,desc)
    self.points += point
    AccountLog.create(:desc => desc,:user_id => self.id,:log_type => "point")
    self.save
  end

  #调整余额
  def adjust_credit(credit,desc)
    self.credits += credit
    AccountLog.create(:desc => desc,:user_id => self.id,:log_type => "credit")
    self.save
  end

  # 每次登陆后调用
  def devise_after_login_in_hook!
  end

  private 
  def set_default
    self.role = "user"
    self.points = 0
    self.credits = 0
    self.lock = false
    self.save
  end

end











# == Schema Information
#
# Table name: users
#
#  id                   :integer(4)      not null, primary key
#  email                :string(255)     default(""), not null
#  encrypted_password   :string(128)     default(""), not null
#  password_salt        :string(255)     default(""), not null
#  confirmation_token   :string(255)
#  confirmed_at         :datetime
#  confirmation_sent_at :datetime
#  reset_password_token :string(255)
#  remember_token       :string(255)
#  remember_created_at  :datetime
#  sign_in_count        :integer(4)      default(0)
#  current_sign_in_at   :datetime
#  last_sign_in_at      :datetime
#  current_sign_in_ip   :string(255)
#  last_sign_in_ip      :string(255)
#  created_at           :datetime
#  updated_at           :datetime
#  nick                 :string(255)
#  role                 :string(255)
#  points               :integer(4)
#  credits              :decimal(10, 2)
#  invites              :integer(4)
#  avatar_file_name     :string(255)
#  avatar_content_type  :string(255)
#  avatar_file_size     :integer(4)
#  avatar_updated_at    :datetime
#  lock                 :boolean(1)
#

