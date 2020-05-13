class CreateTweetTexts < ActiveRecord::Migration[6.0]
  def change
    create_table :tweet_texts do |t|

      t.timestamps
    end
  end
end
