class AddDeletedAtToAlltable < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :deleted_at, :datetime
    add_index :users, :deleted_at
    add_column :tweets, :deleted_at, :datetime
    add_index :tweets, :deleted_at
  end
end
