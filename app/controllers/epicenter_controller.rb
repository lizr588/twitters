class EpicenterController < ApplicationController
  before_action :authenticate_user!

  def feed
    @following_tweeters = []

    Tweeter.all.each do |tweet|
      if
        current_user.following.include?(tweet.user_id) || current_user.id == tweet.user_id
        @following_tweeters.push(tweet)
        # puts current_user.id.to_s + " ones"
        # puts tweet.user_id.to_s + " two"
        # puts tweet
      end
    end
  end

  def all_users
    @users = User.all
  end

  def show_user
    @user = User.find(params[:id])
  end


  def tag_tweets
    @tag = Tag.find(params[:id])
  end

  def now_following
    current_user.following.push(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def following
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if @user.following.include?(user.id)
        @users.push(user)
      end
    end
  end

  def followers
    @user = User.find(params[:id])
    @users = []

    User.all.each do |user|
      if user.following.include?(@user.id)
        @users.push(user)
      end
    end
  end

end
