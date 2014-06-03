require 'spec_helper'

describe 'Orders page' do
  let(:post) { create(:post, title: 'Pretty picture') }
  let(:user) { create(:user, email: 'customer@blah.com') }
  let(:admin) { create(:admin) }

  context 'with no orders made' do
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

  context 'with orders made' do
    before do
      login_as admin, scope: :admin
      christmas_day = Date.new(2013, 12, 25)

      Order.create(id: 1, post: post, user: user, created_at: christmas_day)
      visit '/orders'
    end

    it 'displays the product' do
      expect(page).to have_link 'Pretty picture'
    end

    it 'displays the customer email' do
      expect(page).to have_content 'customer@blah.com'
    end

    it 'displays an order number' do
      expect(page).to have_content '2512130001'
    end
  end
end
