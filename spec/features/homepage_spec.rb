require 'rails_helper'

describe 'Homepage' do
  it 'should allows the admin to approve from the homepage' do
    post = FactoryGirl.create(:post)
    admin_user = FactoryGirl.create(:admin)
    login_as(admin_user, :scope => :user)

    visit root_path

    click_on("approve_#{post.id}")
    expect(post.reload.status).to eq('approved')
  end


end