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
#  retweet_id :integer
#  user_id    :bigint
#
# Indexes
#
#  index_tweets_on_user_id  (user_id)
#

class Tweet < ApplicationRecord
  validates :content, presence: true, length: { maximum: 140 }
  belongs_to :user
end
