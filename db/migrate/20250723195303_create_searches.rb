class CreateSearches < ActiveRecord::Migration[8.0]
  def change
    create_table :searches do |t|
      t.string :user_ip
      t.string :user_search

      t.timestamps
    end
  end
end
