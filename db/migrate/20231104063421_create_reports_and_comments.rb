class CreateReportsAndComments < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :user_id, null: false
      t.string :title
      t.string :content
      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :commentable, polymorphic: true, null: false
      t.timestamps
    end
  end
end
