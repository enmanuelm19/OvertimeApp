require "rails_helper"

describe "navigate" do
  before do
    @user = FactoryGirl.create(:user)
    login_as(@user, :scope => :user)
  end


  describe "index" do
    before do
      post1 = FactoryGirl.create(:post)
      post2 = FactoryGirl.create(:second_post)
      visit posts_path
    end
    it "can be reached" do
      expect(page.status_code).to eq 200
    end
    it "has a title of posts" do
      expect(page).to have_content(/Posts/)
    end
    it "has a list of posts" do
      expect(page).to have_content(/rationale|content/)
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


    it "will have a user asociated" do
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "user_association"

      click_on "Save"

      expect(User.last.posts.last.rationale).to eq("user_association")
    end
  end
end
