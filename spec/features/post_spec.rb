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

  describe "new" do
    it "has a link from homepage" do
      visit root_path
      click_link("new_post_nav")
      expect(page.status_code).to eq(200)
    end
  end

  describe "delete" do
    it "can be deleted" do
      post = FactoryGirl.create(:post)
      visit posts_path
      click_link("delete_#{post.id}_index")
      expect(page.status_code).to eq(200)
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

  describe "Edit" do
    before do
      @post = FactoryGirl.create(:post)
    end


    it "can be reached from index page" do
      visit posts_path
      click_link("edit_#{@post.id}")
      expect(page.status_code).to eq(200)
    end

    it "can be edited" do
      visit edit_post_path(@post)
      fill_in 'post[date]', with: Date.today
      fill_in 'post[rationale]', with: "edited content"

      click_on "Save"
      expect(page).to have_content("edited content")
    end
  end
end
