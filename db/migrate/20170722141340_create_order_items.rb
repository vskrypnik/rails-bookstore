# frozen_string_literal: true

class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.references :book, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
