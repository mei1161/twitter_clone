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

class TweetText < Tweet
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user
end
