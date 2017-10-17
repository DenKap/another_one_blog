require 'rails_helper.rb'

feature 'Creating post' do
  let!(:category) { create(:category) }

  scenario 'can create a post' do
    visit '/'
    visit category_path(1)
    click_link 'Add Post'
    fill_in 'post_name', with: 'First Post.'
    click_button 'Send'
    expect(page).to have_content('First Post.')
  end
end
