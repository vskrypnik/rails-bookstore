# frozen_string_literal: true

RSpec.feature 'Home', :js do
  feature 'Header' do
    feature 'Bookstore' do
      scenario 'Redirects to home page'
    end

    feature 'Home' do
      scenario 'Redirects to home page'
    end

    feature 'Shop' do
      scenario 'Redirects to shop page'
    end

    feature 'My account' do
      context 'Signed in user' do
        scenario 'Redirects to account'
      end

      context 'Guest user' do
        scenario 'Redirects to Login page'
      end
    end

    feature 'Cart' do
      scenario 'Redirects to cart page'

      feature 'Items number' do
        context 'Empty cart' do
          scenario 'Shows empty cart icon'
        end

        context 'Not empty cart' do
          scenario 'Shows cart icon with number of items'
        end
      end
    end
  end

  feature 'Body' do
    feature 'Carousel' do
      scenario 'Slides' do
        books = create_list(:book, 4)

        visit '/'

        find('li[data-slide-to="0"]').click

        books[1..4].reverse.cycle(2).each do |book|
          expect(page).to have_content(book.name)
          expect(page).to have_content(book.description)

          # TODO: check info about authors
          # TODO: check book cover image

          sleep(1)

          find('.icon-next').click
        end
      end

      feature 'Buy Now' do
        scenario 'Shows notification'
        scenario 'Increments cart items number'
      end
    end

    feature 'Greeting' do
      feature 'Get Started' do
        scenario 'Redirects to shop page'
      end
    end

    feature 'Best Sellers' do
      scenario 'Shows 4 most popular books'

      context 'Available book' do
        feature 'Details button' do
          scenario 'Redirects to page with book info'
        end

        feature 'Add to cart button' do
          scenario 'Shows notification'
          scenario 'Increments cart items number'
        end
      end
    end
  end

  feature 'Footer' do
    feature 'Home' do
      scenario 'Redirects to home page'
    end

    feature 'Shop' do
      scenario 'Redirects to shop page'
    end

    feature 'Orders' do
      scenario 'Redirects to orders page'
    end

    feature 'Settings' do
      scenario 'Redirects to settings page'
    end
  end
end
