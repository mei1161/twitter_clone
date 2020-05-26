# frozen_string_literal: true

# == Schema Information
#
# Table name: follows
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  follow_id  :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_follows_on_user_id  (user_id)
#

class Follow < ApplicationRecord
  belongs_to :user
  belongs_to :follow, class_name: 'User'
end
