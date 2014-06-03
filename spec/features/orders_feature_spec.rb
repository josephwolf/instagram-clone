require 'spec_helper'

describe 'Orders page' do
  let(:post) { create(:post, title: 'Pretty picture') }
  let(:user) { create(:user, email: 'customer@blah.com') }
  let(:admin) { create(:admin) }

  context 'logged in as admin' do
    
    before do
      login_as admin, scope: :admin
    end

    it 'should start with no orders' do
      visit '/orders'
      expect(page).to have_content 'No orders yet!'
    end
  end

  context 'logged in as user' do

  	before do
  		login_as user, scope: :user
  	end

  	it 'should redirect users to admin sign in' do
  		visit '/orders'
  		expect(current_path).to eq('/admins/sign_in')
  	end
  end
end
