require 'rails_helper'

RSpec.describe "movements/index", type: :view do
  before(:each) do
    store = create(:store)
    create_list(:movement, 20, store:)

    assign(:store, store)
    assign(:movements, Movement.page)
  end

  it "renders a list of movements" do
    render
    cell_selector = 'tbody>tr'
    assert_select cell_selector, count: 10
  end
end
