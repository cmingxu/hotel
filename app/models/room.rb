class Room < ActiveRecord::Base
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
#

