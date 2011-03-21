class Category < ActiveRecord::Base
  has_many :products
  #has_ancestry
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  ancestry   :string(255)
#  created_at :datetime
#  updated_at :datetime
#

