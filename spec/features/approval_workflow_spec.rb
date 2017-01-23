require 'rails_helper'

describe "navigate" do
  before do
    @admin_user = FactoryGirl.create(:admin)
    login_as(@admin_user, :scope => :user)
  end

  describe "edit" do
    before do
      @post = Post.create(date: Date.today, rationale: "Rationale")
      visit edit_post_path(@post)
    end

    it "has a status that can be edited on the form by an admin" do

      choose('post_status_approved')
      click_on "Save"
      expect(@post.reload.status).to eq('approved')
    end

    it "can not be edited by non admin" do
      logout(:user)
      @regular_user = FactoryGirl.create(:user)
      login_as(@regular_user, :scope => :user)

      visit edit_post_path(@post)

      expect(page).to_not have_content('Approved') 
    end
  end
end