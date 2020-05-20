# frozen_string_literal: true

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

class Tweet < ApplicationRecord
  validates :content, length: { maximum: 140 }
  belongs_to :user
  has_many :retweets
  belongs_to :reply, foreign_key: :reply_id, class_name: 'Tweet' ,optional: true
  has_many :replies, foreign_key: :reply_id, class_name: 'Tweet'
  has_many :likes
end
