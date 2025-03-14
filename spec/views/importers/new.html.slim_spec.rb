require 'rails_helper'

RSpec.describe "importers/new", type: :view do
  before(:each) do
    assign(:importer, Importer.new())
    assign(:errors, {})
  end

  it "renders new importer form" do
    render

    assert_select "form[action=?][method=?]", importers_path, "post" do
    end
  end
end
