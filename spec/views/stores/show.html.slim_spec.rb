require 'rails_helper'

RSpec.describe 'stores/show', type: :view do
  before(:each) do
    store = create(:store)
    create_list(:movement, 20, store:)

    assign(:store, store)
    assign(:movements, store.movements.page)
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
  end
end
