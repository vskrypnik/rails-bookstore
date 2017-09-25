# frozen_string_literal: true

SHARED_FOOTER = proc do
  scenario 'can click Home link' do
    visit('/shop')
    expect(page).to have_content('Catalog')

    within('footer') { click_link('Home') }
    expect(page).to have_content('Welcome to our amazing Bookstore!')
  end

  scenario 'can click Shop link' do
    visit('/')
    expect(page).to have_content('Welcome to our amazing Bookstore!')

    within('footer') { click_link('Shop') }
    expect(page).to have_content('Catalog')
  end
end

RSpec.feature 'In footer', :js do
  context 'authorized user' do
    before do
      user = create(:confirmed_user)
      login_as(user, scope: :user)
    end

    scenario 'can click Settings link' do
      visit '/'
      expect(page).to have_content('Welcome to our amazing Bookstore!')

      within('footer') { click_link('Settings') }
      expect(page).to have_content('Settings')
    end

    scenario 'can click Orders link'

    class_eval(&SHARED_FOOTER)
  end

  context 'guest' do
    scenario 'can click Settings link' do
      visit('/')
      expect(page).to have_content('Welcome to our amazing Bookstore!')

      within('footer') { click_link('Settings') }
      expect(page).to have_content('Sign In')
    end

    scenario 'can click Orders link', :skip do
      visit('/')
      expect(page).to have_content('Welcome to our amazing Bookstore!')

      within('footer') { click_link('Orders') }
      expect(page).to have_content('Sign In')
    end

    class_eval(&SHARED_FOOTER)
  end
end
