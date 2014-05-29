require 'spec_helper.rb'

describe 'Posts' do
	it 'should be able to make a new post on the homeplage' do
		visit '/posts/new'
		attach_file 'Picture', Rails.root.join('public/images/pac-man-space-102830.jpg')
		click_button 'Create Post'
		expect(page).to have_css 'img.uploaded-pic'
	end

	xit 'should take you to a more detailed page when clicked on' do
		visit '/'

	end
end