# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[5.1]
  def change
    create_table :authors do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :description, null: false
    end

    create_join_table(:authors, :books, column_options: {
                        index: true, foreign_key: true
                      })

    add_index :authors_books, %i[author_id book_id], unique: true
  end
end
