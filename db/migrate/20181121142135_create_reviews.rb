class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :business, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :up
      t.date :date
      t.string :review_text

      t.timestamps
    end
  end
end
