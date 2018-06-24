class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.build(tweet_params)
    @tweet.save!
    redirect_back(fallback_location: root_path)
  end


  private
  def tweet_params
    params.require(:tweet).permit(:description)
  end
end
