require 'rails_helper'

RSpec.describe "articles/index", type: :view do
  before(:each) do
    assign(:articles, [
      Article.create!(
        :code => "Code",
        :name => "Name",
        :units => 2,
        :price => 3.5
      ),
      Article.create!(
        :code => "Code",
        :name => "Name",
        :units => 2,
        :price => 3.5
      )
    ])
  end

  it "renders a list of articles" do
    render
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.5.to_s, :count => 2
  end
end
