# frozen_string_literal: true

class CreateRetweets < ActiveRecord::Migration[6.0]
  def change
    create_table :retweets do |t|
      t.bigint :retweet_id
      t.bigint :tweet_id
      t.timestamps
    end
  end
end
