# frozen_string_literal: true

class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links do |t|
      t.text :full_link
      t.string :short_link, limit: 8

      t.timestamps
    end

    add_index :links, :short_link, unique: true
  end
end
