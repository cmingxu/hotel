class Image < ActiveRecord::Base
  belongs_to :owner,:polymorphic => true
  has_attached_file :icon, :styles => {:b=> "600x600#", :m => "400x400#",:s => "55x55#"},
  :url => "/upload/pictures/:owner_type/:id/:id_:style.:extension",
  :path => ":rails_root/public/upload/pictures/:owner_type/:id/:id_:style.:extension"

#  validates_attachment_size :data, :less_than=>2.megabytes
  validates_attachment_content_type :icon, 
    :content_type => ['image/jpeg', 'image/png', 'image/gif', 'image/x-png', 'image/pjpeg'],
    :message => "只能上传图片文件，仅允许jpg,gif,bmp,png格式"

  def self.site_images
    find(:all,:conditions => "owner_type= 'Site'")
  end
 
end




# == Schema Information
#
# Table name: images
#
#  id                :integer(4)      not null, primary key
#  owner_id          :integer(4)
#  owner_type        :string(255)
#  icon_file_name    :string(255)
#  icon_content_type :string(255)
#  icon_file_size    :integer(4)
#  icon_updated_at   :datetime
#  desc              :string(255)
#

