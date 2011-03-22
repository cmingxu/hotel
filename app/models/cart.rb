
class LI
  attr_accessor :room_id,:quantity,:begin_date,:end_date

  def to_s
    "<room_id #{self.room_id},quantity,#{self.quantity},begin_date#{self.begin_date} ,end_date#{end_date}>"
  end

  def initialize(room_id,quantity,begin_date,end_date)
    quantity = quantity.abs
    self.room_id = room_id
    self.quantity = quantity
    self.begin_date = Date.parse(begin_date)
    self.end_date   = Date.parse(end_date)
  end

  def room
    Room.find(self.room_id)
  end

  def day
    (self.end_date - self.begin_date).to_i
  end

  def price
    self.room.price * self.day * self.quantity
  end

end
class Cart
  attr_accessor :line_items

  def initialize
    @line_items = []
  end

  def to_s
    self.line_items.collect(&:to_s).join(",")
  end

  def change_count(room_id,count)
    li = line_items.select {|li| li.room_id ==room_id}.first
    li.quantity = count.to_i
  end

  def add(room_id,quantity,begin_date,end_date)
    quantity = quantity.abs
    li = line_items.select {|li| li.room_id== room_id}.first
    actual_quantity = quantity
    if li
      actual_quantity =  li.quantity + quantity
    end
    self.remove(room_id)
    @line_items << LI.new(room_id,quantity,begin_date,end_date)
  end

  def remove(room_id)
    @line_items.reject!{|li| li.room_id==room_id}
  end

  def total_price
    self.line_items.sum(&:price)
  end

  def total_quantity
    self.line_items.sum(&:quantity)
  end

  def blank?
    @line_items.blank?
  end

end


