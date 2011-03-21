require 'spec_helper'

describe "/suppliers/edit.html.erb" do
  include SuppliersHelper

  before(:each) do
    assigns[:supplier] = @supplier = stub_model(Supplier,
      :new_record? => false,
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

  it "renders the edit supplier form" do
    render

    response.should have_tag("form[action=#{supplier_path(@supplier)}][method=post]") do
      with_tag('input#supplier_short_name[name=?]', "supplier[short_name]")
      with_tag('input#supplier_name[name=?]', "supplier[name]")
      with_tag('input#supplier_desc[name=?]', "supplier[desc]")
      with_tag('input#supplier_source[name=?]', "supplier[source]")
      with_tag('input#supplier_contactor[name=?]', "supplier[contactor]")
      with_tag('input#supplier_tel[name=?]', "supplier[tel]")
      with_tag('input#supplier_address[name=?]', "supplier[address]")
      with_tag('input#supplier_qq[name=?]', "supplier[qq]")
      with_tag('input#supplier_ali_wangwang[name=?]', "supplier[ali_wangwang]")
      with_tag('input#supplier_email[name=?]', "supplier[email]")
      with_tag('input#supplier_province[name=?]', "supplier[province]")
      with_tag('input#supplier_city[name=?]', "supplier[city]")
      with_tag('input#supplier_level[name=?]', "supplier[level]")
      with_tag('textarea#supplier_remark[name=?]', "supplier[remark]")
      with_tag('input#supplier_daifa[name=?]', "supplier[daifa]")
    end
  end
end
