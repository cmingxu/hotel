require 'spec_helper'

describe "/products/index.html.erb" do
  include ProductsHelper

  before(:each) do
    assigns[:products] = [
      stub_model(Product,
        :title => "value for title",
        :lite_title => "value for lite_title",
        :value => 9.99,
        :price => 9.99,
        :desc => "value for desc",
        :book_count => 1,
        :brand_id => 1,
        :genre_id => 1,
        :inventory_count => 1,
        :width => 9.99,
        :height => 9.99
      ),
      stub_model(Product,
        :title => "value for title",
        :lite_title => "value for lite_title",
        :value => 9.99,
        :price => 9.99,
        :desc => "value for desc",
        :book_count => 1,
        :brand_id => 1,
        :genre_id => 1,
        :inventory_count => 1,
        :width => 9.99,
        :height => 9.99
      )
    ]
  end

  it "renders a list of products" do
    render
    response.should have_tag("tr>td", "value for title".to_s, 2)
    response.should have_tag("tr>td", "value for lite_title".to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", "value for desc".to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 1.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
    response.should have_tag("tr>td", 9.99.to_s, 2)
  end
end
