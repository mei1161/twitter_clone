# == Schema Information
#
# Table name: images
#
#  id         :bigint           not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  tweet_id   :bigint
#
# Indexes
#
#  index_images_on_tweet_id  (tweet_id)
#

require 'test_helper'

class ImageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
