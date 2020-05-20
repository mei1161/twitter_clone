# == Schema Information
#
# Table name: likes
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_likes_on_tweet_id  (tweet_id)
#  index_likes_on_user_id   (user_id)
#

require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
