require 'spec_helper'

describe Post do
	let(:post) { create(:post) }
	
	describe '#tag_names=' do
		describe 'no tags' do
			it 'does nothing' do
				post.tag_names = ''
				expect(post.tags).to be_empty
			end
		end

		describe 'one tag' do
			it 'adds a single tag tothe post' do
				post.tag_name = 'yolo'
				expect(post.tags.count).to eq 1
			end

			it 'prepends the tag with a #' do
				post.tag_name = 'yolo'
				tag = post.tags.last

				expect(tag.name).to eq '#yolo'				
			end
		end
	end
end