class Room < ActiveRecord::Base
  has_one :line_item

  ROOM_CATE = {:room => "客房设施",
               :food => "餐饮设施",
               :meeting => "会议设施",
               :sports => "娱乐设施" }

  has_attached_file :icon, :styles => {:b=> "600x600#", :m => "400x400#",:s => "55x55#"},
  :url => "/upload/pictures/:id/:id_:style.:extension",
  :path => ":rails_root/public/upload/pictures/:id/:id_:style.:extension"



  def self.avaliable(begin_time,end_time,quantity)
    true
  end
end




# == Schema Information
#
# Table name: rooms
#
#  id                    :integer(4)      not null, primary key
#  price                 :integer(10)
#  online_price          :integer(10)
#  price_with_breakfirst :integer(10)
#  breakfirst_price      :integer(10)
#  bed_price             :integer(10)
#  service_price         :integer(10)
#  quantity              :integer(4)
#  created_at            :datetime
#  updated_at            :datetime
#  name                  :string(255)
#  cate                  :string(255)
#  desc                  :text
#  icon_file_name        :string(255)
#  icon_content_type     :string(255)
#  icon_file_size        :integer(4)
#  icon_updated_at       :datetime
#

