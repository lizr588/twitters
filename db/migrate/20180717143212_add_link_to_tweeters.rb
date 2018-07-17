class AddLinkToTweeters < ActiveRecord::Migration[5.2]
  def change
    add_column :tweeters, :link, :string
  end
end
