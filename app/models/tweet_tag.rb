class TweetTag < ApplicationRecord
  belongs_to :tweeter
  belongs_to :tag
end
