# frozen_string_literal: true

# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  content    :text
#  deleted_at :datetime
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  reply_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_tweets_on_deleted_at  (deleted_at)
#  index_tweets_on_user_id     (user_id)
#

class TweetRetweet < Tweet
  belongs_to :user
  has_one :retweet, foreign_key: :retweet_id
end
