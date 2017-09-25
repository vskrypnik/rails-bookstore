# frozen_string_literal: true

RSpec.feature 'On Sign In page', :js do
  context 'authorized user' do
    scenario 'is redirected to home page and sees notification' do
      user = create(:confirmed_user)
      login_as(user, scope: :user)

      visit('/users/sign_in')
      expect(page).to have_content('You are already signed in.')
      expect(page).to have_content('Welcome to our amazing Bookstore!')
    end
  end

  context 'guest' do
    scenario 'can sign in with Facebook', :skip

    context 'if user with such email has aleady been registered' do
      context 'and email was confirmed' do
        scenario 'enters no data' do
          user = create(:confirmed_user)

          visit '/users/sign_in'

          click_button('Sign In')

          expect(page).to have_content('Invalid Email or password.')
        end

        scenario 'enters valid data' do
          user = create(:confirmed_user)

          visit('/users/sign_in')
          fill_in(:user_email, with: user.email)
          fill_in(:user_password, with: user.password)

          click_button('Sign In')

          expect(page).to have_content('Signed in successfully.')
        end

        scenario 'enters invalid data'
      end

      context 'and email was not confirmed' do
        scenario 'enters no data'

        scenario 'enters valid data' do
          user = create(:user)

          visit('/users/sign_in')
          fill_in(:user_email, with: user.email)
          fill_in(:user_password, with: user.password)

          click_button('Sign In')

          expect(page).to have_content('You have to confirm your email address before continuing.')
        end

        scenario 'enters invalid data'
      end
    end

    context 'if user with such email has never been registered' do
      scenario 'enters email and password' do
        user = attributes_for(:user)

        visit('/users/sign_in')
        fill_in(:user_email, with: user[:email])
        fill_in(:user_password, with: user[:password])

        click_button('Sign In')

        expect(page).to have_content('Invalid Email or password.')
      end
    end

    feature 'can use link to' do
      scenario 'forgot password page' do
        visit('/users/sign_in')

        click_link('Forgot password?')

        expect(page).to have_content('Forgot your password?')
      end

      scenario 'Sign Up page' do
        visit('/users/sign_in')

        click_link('Sign Up')

        expect(page).to have_content('Sign Up')
      end
    end
  end
end
