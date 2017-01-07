require "rails_helper"

describe "navigate" do
  before do
    @user = User.create(email: "test@test.com", password: "12345678", password_confirmation: "12345678", first_name: "John", last_name: "Snow")
    login_as(@user, :scope => :user)
  end


  describe "index" do
    before do
      post1 = Post.create(date: Date.today, rationale: "Post1", user_id: @user.id)
      post2 = Post.create(date: Date.today, rationale: "Post2", user_id: @user.id)
      visit posts_path
    end
    it "can be reached" do
      expect(page.status_code).to eq 200
    end
    it "has a title of posts" do
      expect(page).to have_content(/Posts/)
    end
    it "has a list of posts" do
      expect(page).to have_content(/Post1|Post2/)
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
