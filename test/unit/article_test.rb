require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end


# == Schema Information
#
# Table name: articles
#
#  id           :integer(4)      not null, primary key
#  title        :string(255)
#  content      :text
#  created_by   :integer(4)
#  state        :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  last_edit_by :integer(4)
#

