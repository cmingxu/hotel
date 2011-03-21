require 'test_helper'

class StyleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: styles
#
#  id              :integer(4)      not null, primary key
#  product_id      :integer(4)
#  name            :string(255)
#  sku             :string(255)
#  disable         :boolean(1)
#  created_at      :datetime
#  updated_at      :datetime
#  inventory_count :integer(4)
#

