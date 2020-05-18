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

require 'test_helper'

class RetweetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
