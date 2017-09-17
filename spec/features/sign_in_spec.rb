# frozen_string_literal: true

RSpec.feature 'Sign In', :js do
  scenario 'Show title' do
    visit '/users/sign_in'

    expect(page).to have_content('Sign In')
  end

  feature 'Facebook' do
    scenario 'Sign In with Facebook'
  end

  feature 'Email and Password' do
    context 'Registered user'
    context 'Unregistered user'
  end

  feature 'Links' do
    feature 'Forgot Password'
    feature 'Button Sign In'
    feature 'Do not have an account'
  end
end
