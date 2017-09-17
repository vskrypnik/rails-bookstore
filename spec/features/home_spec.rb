# frozen_string_literal: true

RSpec.feature 'Home', :js do
  feature 'Body' do
    feature 'Carousel' do
      scenario 'Slides' do
        books = create_list(:book_with_authors, 4)

        visit '/'

        within '.carousel' do
          find('li[data-slide-to="0"]').click

          books[1..4].reverse.cycle(2).each do |book|
            expect(page).to have_content(book.name)
            expect(page).to have_content(book.description)

            expect(page).to have_content(
              book.authors.map(&:full_name).to_sentence
            )

            # TODO: check book cover image

            sleep(1)

            find('.icon-next').click
          end
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
      scenario 'Shows 4 most popular books' do
        bestsellers_books = Array.new(5) do |order_items_count|
          create(:book_with_order_items, order_items_count: order_items_count)
        end

        visit '/'

        within '#bestsellers' do
          bestsellers_books[1..5].each do |book|
            expect(page).to have_content(book.name)

            expect(page).to have_content(
              book.authors.map(&:full_name).to_sentence
            )
          end
        end
      end

      context 'Available book' do
        feature 'Details button' do
          scenario 'Redirects to page with book info'
        end

        feature 'Add to cart button' do
          scenario 'Shows notification'
          scenario 'Increments cart items number'
        end
      end

      context 'Unavailable book' do
        scenario 'Has no action page on hover'
      end
    end
  end
end
