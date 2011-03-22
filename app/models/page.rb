class Page < ActiveRecord::Base
  has_many :images,:as => :owner

  def to_param
    self.slug or self.id
  end
end


# == Schema Information
#
# Table name: pages
#
#  id          :integer(4)      not null, primary key
#  content     :text
#  meta        :string(255)
#  description :string(255)
#  slug        :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

