class CreateTweetImages < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_images do |t|

      t.timestamps
    end
  end
end
