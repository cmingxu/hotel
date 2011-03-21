require 'spec_helper'

describe "/suppliers/show.html.erb" do
  include SuppliersHelper
  before(:each) do
    assigns[:supplier] = @supplier = stub_model(Supplier,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ short_name/)
    response.should have_text(/value\ for\ name/)
    response.should have_text(/value\ for\ desc/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ contactor/)
    response.should have_text(/value\ for\ tel/)
    response.should have_text(/value\ for\ address/)
    response.should have_text(/value\ for\ qq/)
    response.should have_text(/value\ for\ ali_wangwang/)
    response.should have_text(/value\ for\ email/)
    response.should have_text(/value\ for\ province/)
    response.should have_text(/value\ for\ city/)
    response.should have_text(/1/)
    response.should have_text(/value\ for\ remark/)
    response.should have_text(/false/)
  end
end
