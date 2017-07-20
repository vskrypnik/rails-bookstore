# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :name, null: false, index: true
      t.string :description, null: false

      t.timestamps null: false
    end
  end
end
