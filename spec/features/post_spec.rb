require "rails_helper"

describe "navigate" do
  describe "index" do
    it "can be reached" do
      visit posts_path
      expect(page.status_code).to eq 200
    end
    it "has a title of posts" do
      visit posts_path
      expect(page).to have_content(/Posts/)
    end
  end

  describe "Creation" do
    before do
      visit new_post_path
    end
    it "has a form that can be reached" do
      expect(page.status_code).to eq 200
    end

    it "can be created from form page" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "some rationale"

      click_on "Save"

      expect(page).to have_content("some rationale")
    end
  end
end
