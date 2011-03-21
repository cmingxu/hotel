require 'test_helper'

class PageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

