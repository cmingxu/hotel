require 'test_helper'

class DealTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end



# == Schema Information
#
# Table name: deals
#
#  id                    :integer(4)      not null, primary key
#  title                 :string(255)
#  lite_title            :string(255)
#  start_date            :datetime
#  end_date              :datetime
#  duration              :integer(4)
#  product_id            :integer(4)
#  value                 :integer(10)
#  price                 :integer(10)
#  vip_price             :integer(10)
#  deal_price            :integer(10)
#  important             :text
#  desc                  :text
#  deal_status           :string(255)
#  audit_status          :string(255)
#  per_user_limit        :integer(4)
#  product_batch_code    :string(255)
#  product_serial_number :string(255)
#  books_account         :integer(4)
#  base_bought           :integer(4)
#  supplier_id           :integer(4)
#  ship_day              :integer(4)
#  max_buy               :integer(4)
#  created_at            :datetime
#  updated_at            :datetime
#

