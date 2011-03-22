require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
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

