require 'rails_helper'

RSpec.describe "movements/show", type: :view do
  before(:each) do
    store = create(:store)

    assign(:store, store)
    assign(:movement, create(:movement))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
  end
end
