require "rails_helper"

describe "navigate" do
  let(:user) { FactoryGirl.create(:user) }

  let(:post) do
    Post.create(date: Date.today, rationale: "Rationale", user_id: user.id)
  end

  before do
    login_as(user, :scope => :user)
  end


  describe "index" do
    before do
      visit posts_path
    end
    it "can be reached" do
      expect(page.status_code).to eq 200
    end
    it "has a title of posts" do
      expect(page).to have_content(/Posts/)
    end
    it "has a list of posts" do
      post1 = FactoryGirl.build_stubbed(:post)
      post2 = FactoryGirl.build_stubbed(:second_post)
      visit posts_path
      expect(page).to have_content(/Rationale|content/)
    end
    it "has a scope so that only post creator can see their post" do
       other_user = User.create(first_name: "No", last_name: "No", email: "no@no.com", password: "12345678", password_confirmation: "12345678")
       post_from_other_user = Post.create(date: Date.today, rationale: "This shouldn't be seen", user_id: other_user.id)
       visit posts_path
       expect(page).to_not have_content(/This shouldn't be seen/)
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
      logout(:user)
      delete_user = FactoryGirl.create(:user)
      login_as(delete_user)
      post_to_delete = Post.create(date: Date.today, rationale: "asdf", user_id: delete_user.id)
      visit posts_path
      click_link("delete_#{post_to_delete.id}_index")
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
      @post = FactoryGirl.create(:post, user_id: user.id)
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

    it "can not be edited by no authorized user" do
      logout(:user)
      non_authorized_user = FactoryGirl.create(:non_authorized_user)
      login_as(non_authorized_user)
      visit edit_post_path(@post)
      expect(current_path).to eq(root_path)
    end
  end
end
