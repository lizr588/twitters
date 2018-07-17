module TweetersHelper
  def get_tagged(tweeter)

      message_arr = Array.new
      message_arr = tweeter.message.split
      message_arr.each_with_index do |word, index|

        if word[0] == "#"
          if Tag.pluck(:phrase).include?(word.downcase)
            tag = Tag.find_by(phrase: word.downcase)
          else
            tag = Tag.create(phrase: word.downcase)
          end
            # this line is setting the tweed id in the Tag table from the Tweeters table
            tweet_tag = TweetTag.create(tweet_id: tweeter.id, tag_id: tag.id)
            message_arr[index] = "<a href='/tag_tweets?id=#{tag.id}'>#{word}</a>"
        end
      end

      tweeter.update(message: message_arr.join(" "))
      return tweeter
  end
end
