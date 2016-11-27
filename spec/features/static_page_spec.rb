require 'rails_helper'

describe "navigation" do
  describe "homepage" do
    it "can be reached sucessfully" do
      visit root_path
      expect(page.status_code).to eq(200)
    end
  end
end
