class ChangeDataZipToUsers < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :zip, :text
  end
end
