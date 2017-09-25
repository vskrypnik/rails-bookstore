# frozen_string_literal: true

SHARED_HEADER = proc do
  scenario 'can click Bookstore link' do
    visit('/shop')
    expect(page).to have_content('Catalog')

    within('header') { click_link('Bookstore') }
    expect(page).to have_content('Welcome to our amazing Bookstore!')
  end

  scenario 'can click Home link' do
    visit('/shop')
    expect(page).to have_content('Catalog')

    within('header') { click_link('Home') }
    expect(page).to have_content('Welcome to our amazing Bookstore!')
  end

  scenario 'can click Shop link' do
    visit('/')
    expect(page).to have_content('Welcome to our amazing Bookstore!')

    within('header') { click_link('Shop') }
    expect(page).to have_content('Catalog')
  end

  scenario 'can click cart icon'

  context 'with empty cart' do
    scenario 'can see empty cart icon'
  end

  context 'with not empty cart' do
    scenario 'can see cart icon with number of items'
  end
end

RSpec.feature 'In header', :js do
  context 'authorized user' do
    before do
      user = create(:confirmed_user)
      login_as(user, scope: :user)
    end

    context 'after clicking on My account link' do
      scenario 'can see and use Settings link' do
        visit('/')

        within 'header' do
          click_link('My account')

          within '#my-account-dropdown' do
            click_link('Settings')
          end
        end

        within '.page-content' do
          expect(page).to have_content('Settings')
        end
      end

      scenario 'can see and use Sign Out link' do
        visit('/')

        within 'header' do
          click_link('My account')

          within '#my-account-dropdown' do
            expect(page).not_to have_content('Sign In')
            expect(page).not_to have_content('Sign Up')
            expect(page).to have_content('Settings')

            click_link('Sign Out')
          end
        end

        within '.page-content' do
          expect(page).to have_content('Signed out successfully.')
        end

        within 'header' do
          click_link('My account')

          within '#my-account-dropdown' do
            expect(page).not_to have_content('Sign Out')
            expect(page).not_to have_content('Settings')

            expect(page).to have_content('Sign In')
            expect(page).to have_content('Sign Up')
          end
        end
      end

      scenario 'can not see Sign In and Sign Up link' do
        visit('/')

        within 'header' do
          click_link('My account')

          within '#my-account-dropdown' do
            expect(page).not_to have_content('Sign In')
            expect(page).not_to have_content('Sign Up')
          end
        end
      end
    end

    class_eval(&SHARED_HEADER)
  end

  context 'guest' do
    context 'after clicking on My account link' do
      scenario 'can see and use Sign In link' do
        visit('/')

        within 'header' do
          click_link('My account')

          within '#my-account-dropdown' do
            click_link('Sign In')
          end
        end

        expect(page).to have_content('Sign In')
      end

      scenario 'can see and use Sign Up link' do
        visit('/')

        within 'header' do
          click_link('My account')

          within '#my-account-dropdown' do
            click_link('Sign Up')
          end
        end

        within '.page-content' do
          expect(page).to have_content('Sign Up')
        end
      end

      scenario 'can not see Sign Out and Settings link' do
        visit('/')

        within 'header' do
          click_link('My account')

          within '#my-account-dropdown' do
            expect(page).not_to have_content('Sign Out')
            expect(page).not_to have_content('Settings')
          end
        end
      end
    end

    class_eval(&SHARED_HEADER)
  end
end
