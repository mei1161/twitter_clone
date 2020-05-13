# frozen_string_literal: true

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

class Image < ApplicationRecord
  mount_uploader :image, ImagesUploader
  belongs_to :tweet
end
