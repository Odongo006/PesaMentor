require 'rails_helper'

RSpec.describe 'Categories', type: :feature do
  let!(:user) { User.create!(name: 'john_doe', email: 'john5@example.com', password: '123456') }
  let!(:category) { Category.create!(name: 'Food', icon: 'https://previews.123rf.com/images/olgastrelnikova/olgastrelnikova1901/olgastrelnikova190100001/115903194-food-icon-with-smile-label-for-food-company-grocery-store-icon-vector-illustration-with-smiling.jpg', author: user) }
  let!(:category1) { Category.create!(name: 'Clothes', icon: 'https://previews.123rf.com/images/olgastrelnikova/olgastrelnikova1901/olgastrelnikova190100001/115903194-food-icon-with-smile-label-for-food-company-grocery-store-icon-vector-illustration-with-smiling.jpg', author: user) }
  let!(:category2) { Category.create!(name: 'Travel', icon: 'https://previews.123rf.com/images/olgastrelnikova/olgastrelnikova1901/olgastrelnikova190100001/115903194-food-icon-with-smile-label-for-food-company-grocery-store-icon-vector-illustration-with-smiling.jpg', author: user) }

  before do
    visit new_user_session_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log in'
  end

  describe 'New page' do
    it 'creates a new category' do
      visit new_category_path

      expect(page).to have_css('.payments-header')
      expect(page).to have_css('.payments-header i.fa-bars')
      expect(page).to have_css('.payments-header h2', text: 'ADD NEW CATEGORY')
      expect(page).to have_link(href: categories_path) { find('i.fa-arrow-left') }
    end
  end
end