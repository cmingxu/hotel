require 'test_helper'

class ShipTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: ships
#
#  id            :integer(4)      not null, primary key
#  ship_name     :string(255)
#  ship_province :string(255)
#  ship_city     :string(255)
#  ship_address  :string(255)
#  ship_zip      :string(255)
#  ship_mobile   :string(255)
#  ship_tel      :string(255)
#  user_id       :integer(4)
#  created_at    :datetime
#  updated_at    :datetime
#

