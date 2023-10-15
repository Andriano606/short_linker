# frozen_string_literal: true

class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.references :user, null: false, foreign_key: true
      t.text :description
      t.string :name
      t.date :expiration_date

      t.timestamps
    end
  end
end
