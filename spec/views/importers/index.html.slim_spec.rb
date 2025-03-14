require 'rails_helper'

RSpec.describe "importers/index", type: :view do
  before(:each) do
    create(:importer)
    create(:importer)

    assign(:importers, Importer.page)
  end

  it "renders a list of importers" do
    render
    cell_selector = 'div>p'
  end
end
