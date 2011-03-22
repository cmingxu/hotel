class Order < ActiveRecord::Base
  belongs_to :user
  has_many :line_items,:dependent => :destroy
  has_many :rooms,:through => :line_items


  state_machine :order_status,:initial => :new do

    event :confirm do
      transition [:new] => :confirmed
    end

    event :deny do
      transition [:new ] => :denied
    end

    event :close do
      transition [:new,:denied] => :closed
    end
  end


  def self.from_cart(cart)
    order = Order.new 
    order.rooms_price = cart.total_price
    order.quantity       = cart.line_items.sum(&:quantity)
    order.order_number   = generate_order_number
    order.save

    cart.line_items.each do |cli| 
      order.line_items.create do |li|
        li.room_id = cli.room_id
        li.quantity = cli.quantity
        li.sub_total_price = cli.sub_total_price
        li.price = cli.price
      end
    end

    order

  end

  def self.generate_order_number
    last_order_id = Order.last.id rescue 0
    Time.now.strftime("%Y%m%d")+(last_order_id+1).to_s+sprintf("%0.3d",rand(1000))
  end


end




# == Schema Information
#
# Table name: orders
#
#  id           :integer(4)      not null, primary key
#  order_number :string(255)
#  price        :string(255)
#  state        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

