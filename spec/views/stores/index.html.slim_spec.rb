require 'rails_helper'

RSpec.describe "stores/index", type: :view do
  before(:each) do
    create_list(:store, 20)

    assign(:stores, Store.page)
  end

  it "renders a list of stores" do
    render
    cell_selector = 'tbody>tr'
    assert_select cell_selector, count: 10
  end
end
