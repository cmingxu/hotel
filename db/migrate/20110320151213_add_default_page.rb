class AddDefaultPage < ActiveRecord::Migration
  def self.up
    Page.create(:slug => "basic",:content => "酒店介绍") unless Page.find_by_slug("basic")
    Page.create(:slug => "room",:content => "客房介绍") unless Page.find_by_slug("room")
    Page.create(:slug => "meeting",:content => "会议设施") unless Page.find_by_slug("meeting")
    Page.create(:slug => "food",:content => "餐饮设施") unless Page.find_by_slug("food")
    Page.create(:slug => "sports",:content => "餐饮设施") unless Page.find_by_slug("sports")
    Page.create(:slug => "contact",:content => "联系我们") unless Page.find_by_slug("contact")
  end

  def self.down
  end
end
