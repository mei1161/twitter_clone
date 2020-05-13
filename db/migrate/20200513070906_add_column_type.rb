class AddColumnType < ActiveRecord::Migration[6.0]
  def up
    add_column :tweets, :type, :string
  end
end