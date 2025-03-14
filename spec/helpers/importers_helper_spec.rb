require 'rails_helper'

RSpec.describe ImportersHelper, type: :helper do
  describe "error_by_name" do
    it "return a message if the error is present" do
      expect(helper.error_by_name({ fixed_key: [ 'some error' ] }, "fixed_key")).to eq("fixed_key some error")
    end

    it "return nil if the error is present" do
      expect(helper.error_by_name({ fixed_key: [ 'some error' ] }, "wrong_key")).to eq(nil)
    end
  end
end
