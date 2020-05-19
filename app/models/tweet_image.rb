# == Schema Information
#
# Table name: tweets
#
#  id         :bigint           not null, primary key
#  content    :text
#  type       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  reply_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#

class TweetImage < Tweet
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user
  has_one :image, foreign_key: :tweet_id
  accepts_nested_attributes_for :image, allow_destroy: true
end
