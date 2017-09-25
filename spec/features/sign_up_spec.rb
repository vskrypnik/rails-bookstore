# frozen_string_literal: true

RSpec.feature 'On Sign Up page', :js do
  context 'authorized user' do
    scenario 'is redirected to home page and see notification' do
      user = create(:confirmed_user)
      login_as(user, scope: :user)

      visit('/users/sign_up')
      expect(page).to have_content('Welcome to our amazing Bookstore!')
      expect(page).to have_content('You are already signed in.')
    end
  end

  context 'guest' do
    feature 'can sign up with Facebook' do
    end

    scenario 'enter such email that has aleady been registered' do
      user = create(:confirmed_user)

      visit('/users/sign_up')

      fill_in(:user_email, with: user.email)
      fill_in(:user_password, with: user.password)
      fill_in(:user_password_confirmation, with: user.password)

      click_button('Sign Up')

      expect(page).to have_content('Email has already been taken')
    end

    context 'if user with such email has never been registered' do
      scenario 'enters valid email and password' do
        user = attributes_for(:user)

        visit('/users/sign_up')
        fill_in(:user_email, with: user[:email])
        fill_in(:user_password, with: user[:password])
        fill_in(:user_password_confirmation, with: user[:password])

        click_button('Sign Up')

        expect(page).to have_content('A message with a confirmation link has been sent to your email address.')
      end

      scenario 'enters invalid password confirmation' do
        user = attributes_for(:user)
        user1 = attributes_for(:user)

        visit('/users/sign_up')
        fill_in(:user_email, with: user[:email])
        fill_in(:user_password, with: '1235676')
        fill_in(:user_password_confirmation, with: '432fgyg67')

        click_button('Sign Up')

        expect(page).to have_content('Password confirmation doesn\'t match Password')
      end

      scenario 'enters invalid too short password' do
        user = attributes_for(:user)

        visit('/users/sign_up')
        fill_in(:user_email, with: user[:email])
        fill_in(:user_password, with: '123')
        fill_in(:user_password_confirmation, with: '123')

        click_button('Sign Up')

        expect(page).to have_content('Password is too short')
      end
    end

    scenario 'can use link to Sign In page' do
      visit('/users/sign_up')

      click_link('Sign In')

      expect(page).to have_content('Sign In')
    end
  end
end
