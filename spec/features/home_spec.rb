# frozen_string_literal: true

RSpec.describe 'Home', :js do
  describe 'Header' do
    describe 'Bookstore' do
      scenario 'Redirects to home page'
    end

    describe 'Home' do
      scenario 'Redirects to home page'
    end

    describe 'Shop' do
      scenario 'Redirects to shop page'
    end

    describe 'My account' do
      context 'Signed in user' do
        scenario 'Redirects to account'
      end

      context 'Guest user' do
        scenario 'Redirects to Login page'
      end
    end

    describe 'Cart' do
      scenario 'Redirects to cart page'

      describe 'Items number' do
        context 'Empty cart' do
          scenario 'Shows empty cart icon'
        end

        context 'Not empty cart' do
          scenario 'Shows cart icon with number of items'
        end
      end
    end
  end

  describe 'Body' do
    describe 'Carousel' do
      describe 'Books' do
        scenario 'Shows 3 newest books'
      end

      describe 'Slides' do
        scenario 'Can flip the slide'

        describe 'Buy Now' do
          scenario 'Shows notification'
          scenario 'Increments cart items number'
        end
      end
    end

    describe 'Greeting' do
      describe 'Get Started' do
        scenario 'Redirects to shop page'
      end
    end

    describe 'Best Sellers' do
      scenario 'Shows 4 most popular books'

      context 'Available book' do
        describe 'Details button' do
          scenario 'Redirects to page with book info'
        end

        describe 'Add to cart button' do
          scenario 'Shows notification'
          scenario 'Increments cart items number'
        end
      end
    end
  end

  describe 'Footer' do
    describe 'Home' do
      scenario 'Redirects to home page'
    end

    describe 'Shop' do
      scenario 'Redirects to shop page'
    end

    describe 'Orders' do
      scenario 'Redirects to orders page'
    end

    describe 'Settings' do
      scenario 'Redirects to settings page'
    end
  end
end
