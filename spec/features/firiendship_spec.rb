require 'rails_helper'

RSpec.feature 'Friendship Invitations', type: :feature do
  before(:each) do
    @first_user = User.create(name: 'first', email: 'first@first.com', password: 'password')
    @second_user = User.create(name: 'second', email: 'second@second.com', password: 'password')
    visit user_session_path
    fill_in 'Email', with: 'first@first.com'
    fill_in 'Password', with: 'password'
    click_button 'Log in'
  end

  scenario 'should visit timeline page' do
    visit posts_path
    fill_in :Content, with: 'This is my first post'
    click_on 'Save'
    expect(page).to have_text('Recent posts')
  end
end
