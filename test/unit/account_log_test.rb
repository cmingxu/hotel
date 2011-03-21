require 'test_helper'

class AccountLogTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: account_logs
#
#  id         :integer(4)      not null, primary key
#  desc       :string(255)
#  log_type   :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer(4)
#

