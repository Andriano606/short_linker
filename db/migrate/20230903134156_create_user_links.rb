# frozen_string_literal: true

class CreateUserLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :user_links do |t|
      t.references :user, foreign_key: true
      t.references :link, foreign_key: true

      t.timestamps
    end
  end
end
