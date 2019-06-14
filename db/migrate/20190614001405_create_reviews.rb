class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :rating
      t.integer :product_id
      t.integer :user_id
      t.string :summary
      t.string :content

      t.timestamps null: false
    end
  end
end
