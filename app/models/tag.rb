class Tag < ApplicationRecord
  has_many :tweet_tags
  has_many :tweeters, through: :tweet_tags
end
