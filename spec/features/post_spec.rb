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
      user = User.create(email: "test@test.com", password: "12345678", password_confirmation: "12345678", first_name: "John", last_name: "Snow")
      login_as(user, :scope => :user, :run_callbacks => false)
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


    it "will have a user asociated" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "user_association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("user_association")
    end
  end
end
