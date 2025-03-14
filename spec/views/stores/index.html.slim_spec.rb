require 'rails_helper'

RSpec.describe "stores/index", type: :view do
  before(:each) do
    create(:store)
    create(:store)

    assign(:stores, Store.page)
  end

  it "renders a list of stores" do
    render
    cell_selector = 'div>p'
  end
end
