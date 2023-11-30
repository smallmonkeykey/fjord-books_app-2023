class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.integer :user_id, null: false
      t.string :title
      t.string :content
      t.timestamps
    end
  end
end
