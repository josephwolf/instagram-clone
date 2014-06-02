require 'spec_helper.rb'

describe 'Posts' do

	def create_account
		visit '/users/sign_up'
		fill_in 'Email', with: 'joey@wolf.com'
		fill_in 'Password', with: '12345678'
		fill_in 'Password confirmation', with: '12345678'
		click_button 'Sign up'
	end

	def make_post
		visit '/posts/new'
		attach_file 'Picture', Rails.root.join('spec/images/tumblr_myoaafDoi11r0ioi8o1_400.jpg')
		click_button 'Create Post'
	end

	it 'should be able to make a new post on the homeplage' do
		create_account
		make_post
		expect(page).to have_css 'img.uploaded-pic'
	end

	it 'should be able to be deleted' do
		create_account
		make_post
		click_link 'Delete'
		expect(page).not_to have_css 'img.uploaded-pic'
	end
end