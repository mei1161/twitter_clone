class AddColumnReplyid < ActiveRecord::Migration[6.0]
  def up
    add_column :tweets, :reply_id, :bigint
  end
end
