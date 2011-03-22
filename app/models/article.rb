class Article < ActiveRecord::Base
  has_many :images,:as => :owner

  def created_by_who
    User.find(self.created_by).login rescue "未找到"
  end

  def last_edit_by_who
    User.find(self.last_edit_by).login rescue "未找到"
  end

  def hide?
    self.state == "hide"
  end

  state_machine :initial => "published" do
    event :publish do
      transition :from => "hide" ,:to =>  "published"
    end

    event :hide do
      transition :from => "published",:to => "hide"
    end
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

