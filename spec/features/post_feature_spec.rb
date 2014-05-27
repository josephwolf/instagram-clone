require 'spec_helper.rb'

describe 'Posts' do
	it 'should be able to make a new post on the homeplage' do
		visit '/'
		click_button 'New Post'
		fill_in 'imageurl', with: 'http://i0.kym-cdn.com/photos/images/original/000/103/740/c2c.png'
		click_button 'Create Post'
		expect(page).not_to have_content 'No posts yet!'
	end

	it 'should take you to a more detailed page when clicked on' do
		visit '/'

	end
end