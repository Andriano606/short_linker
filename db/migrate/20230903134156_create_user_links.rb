# frozen_string_literal: true

class CreateUserLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_links do |t|
      t.references :user, null: false, foreign_key: true
      t.string :short_link, null: false, limit: 8

      t.timestamps
    end

    add_foreign_key :user_links,
                    :links,
                    column: :short_link,
                    primary_key: :short_link
  end
end
