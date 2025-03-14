require 'rails_helper'

RSpec.describe "importers/index", type: :view do
  before(:each) do
    create_list(:importer, 20)

    assign(:importers, Importer.page)
  end

  it "renders a list of importers" do
    render
    cell_selector = 'tbody>tr'
    assert_select cell_selector, count: 10
  end
end
