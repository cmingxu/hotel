require 'spec_helper'

describe "/products/show.html.erb" do
  include ProductsHelper
  before(:each) do
    assigns[:product] = @product = stub_model(Product,
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
  end

  it "renders attributes in <p>" do
    render
    response.should have_text(/value\ for\ title/)
    response.should have_text(/value\ for\ lite_title/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
    response.should have_text(/value\ for\ desc/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/1/)
    response.should have_text(/9\.99/)
    response.should have_text(/9\.99/)
  end
end
