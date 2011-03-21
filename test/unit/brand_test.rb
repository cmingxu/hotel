require 'test_helper'

class BrandTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end

# == Schema Information
#
# Table name: brands
#
#  id          :integer(4)      not null, primary key
#  name        :string(255)
#  origin      :string(255)
#  supplier_id :integer(4)
#  level       :integer(4)
#  created_at  :datetime
#  updated_at  :datetime
#

