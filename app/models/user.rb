# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  biography              :text
#  birthday               :date
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string(140)      not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  screen_name            :string(20)       not null
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  # --------------------------------------------------------------------------------
  # Validations
  # --------------------------------------------------------------------------------
  validates :screen_name, presence: true, uniqueness: true, length: { in: 5..20 }
  validates :screen_name, ban_reserved: true, uniqueness: { case_sensitive: false }
  validates :screen_name, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :name, presence: true, length: { in: 1..140 }
  validates :biography, length: { maximum: 140 }
  has_many :tweets
  has_many :tweet_retweets
  has_many :retweets, through: :tweet_retweets, source: :retweet
  has_many :likes
end
