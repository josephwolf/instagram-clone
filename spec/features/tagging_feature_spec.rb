require 'spec_helper'

describe 'tagging posts' do 

	before do
		joey = create(:user)
		login_as joey
	end

	it 'displays tags on the post page' do 
		visit '/posts/new'
		fill_in 'Title', with: 'Exciting!'
		fill_in 'Description', with: '... and awful!'
		attach_file 'Picture', Rails.root.join('spec/images/tumblr_myoaafDoi11r0ioi8o1_400.jpg')
		fill_in 'Tags', with: 'exciting, awful'
		click_button 'Create post'

		expect(page).to have_link '#exciting'
		expect(page).to have_link '#awful'
	end
end