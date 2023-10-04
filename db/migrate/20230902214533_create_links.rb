class CreateLinks < ActiveRecord::Migration[7.0]
  def change
    create_table :links, id: false do |t|
      t.text :full_link
      t.string :short_link, primary_key: true, limit: 8

      t.timestamps
    end
  end
end
