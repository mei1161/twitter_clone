# frozen_string_literal: true

# == Schema Information
#
# Table name: retweets
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  retweet_id :bigint
#  tweet_id   :bigint
#

class Retweet < ApplicationRecord
  belongs_to :tweet, class_name: 'Tweet', foreign_key: :tweet_id
  belongs_to :tweet_retweet, class_name: 'Tweet', foreign_key: :tweet_id, optional: true, dependent: :destroy
end
