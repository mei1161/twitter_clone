# frozen_string_literal: true

class CreateFollows < ActiveRecord::Migration[6.0]
  def change
    create_table :follows do |t|
      t.bigint :follow_id
      t.references :user
      t.timestamps
    end
  end
end
