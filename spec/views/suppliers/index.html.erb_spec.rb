require 'spec_helper'

describe "/suppliers/index.html.erb" do
  include SuppliersHelper

  before(:each) do
    assigns[:suppliers] = [
      stub_model(Supplier,
        :short_name => "value for short_name",
        :name => "value for name",
        :desc => "value for desc",
        :source => 1,
        :contactor => "value for contactor",
        :tel => "value for tel",
        :address => "value for address",
        :qq => "value for qq",
        :ali_wangwang => "value for ali_wangwang",
        :email => "value for email",
        :province => "value for province",
        :city => "value for city",
        :level => 1,
        :remark => "value for remark",
        :daifa => false
      ),
      stub_model(Supplier,
        :short_name => "value for short_name",
        :name => "value for name",
        :desc => "value for desc",
        :source => 1,
        :contactor => "value for contactor",
        :tel => "value for tel",
        :address => "value for address",
        :qq => "value for qq",
        :ali_wangwang => "value for ali_wangwang",
        :email => "value for email",
        :province => "value for province",
        :city => "value for city",
        :level => 1,
        :remark => "value for remark",
        :daifa => false
      )
    ]
  end

  it "renders a list of suppliers" do
    render
    response.should have_tag("tr>td", "value for short_name".to_s, 2)
    response.should have_tag("tr>td", "value for name".to_s, 2)
    response.should have_tag("tr>td", "value for desc".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for contactor".to_s, 2)
    response.should have_tag("tr>td", "value for tel".to_s, 2)
    response.should have_tag("tr>td", "value for address".to_s, 2)
    response.should have_tag("tr>td", "value for qq".to_s, 2)
    response.should have_tag("tr>td", "value for ali_wangwang".to_s, 2)
    response.should have_tag("tr>td", "value for email".to_s, 2)
    response.should have_tag("tr>td", "value for province".to_s, 2)
    response.should have_tag("tr>td", "value for city".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", "value for remark".to_s, 2)
    response.should have_tag("tr>td", false.to_s, 2)
  end
end
