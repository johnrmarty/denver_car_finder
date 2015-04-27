class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.string :heading
      t.text :body
      t.decimal :price
      t.string :external_url
      t.string :timestamp

      t.timestamps null: false
    end
  end
end
