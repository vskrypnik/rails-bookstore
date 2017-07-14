# frozen_string_literal: true

RSpec.describe 'Can see home page', :js do
  it 'Displays home page' do
    visit('/')

    expect(page).to have_content('Yay! You’re on Rails!')
  end
end
