class CreateMentions < ActiveRecord::Migration[7.0]
  def change
    create_table :mentions do |t|
      t.references :mentioning, :mentioned, null: false, foreign_key: {to_table: :reports}
      t.timestamps
    end
    add_index :mentions, [:mentioning_id, :mentioned_id], unique: true
  end
end
