require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

