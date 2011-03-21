require 'spec_helper'

describe "/products/edit.html.erb" do
  include ProductsHelper

  before(:each) do
    assigns[:product] = @product = stub_model(Product,
      :new_record? => false,
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

  it "renders the edit product form" do
    render

    response.should have_tag("form[action=#{product_path(@product)}][method=post]") do
      with_tag('input#product_title[name=?]', "product[title]")
      with_tag('input#product_lite_title[name=?]', "product[lite_title]")
      with_tag('input#product_value[name=?]', "product[value]")
      with_tag('input#product_price[name=?]', "product[price]")
      with_tag('textarea#product_desc[name=?]', "product[desc]")
      with_tag('input#product_book_count[name=?]', "product[book_count]")
      with_tag('input#product_brand_id[name=?]', "product[brand_id]")
      with_tag('input#product_genre_id[name=?]', "product[genre_id]")
      with_tag('input#product_inventory_count[name=?]', "product[inventory_count]")
      with_tag('input#product_width[name=?]', "product[width]")
      with_tag('input#product_height[name=?]', "product[height]")
    end
  end
end
