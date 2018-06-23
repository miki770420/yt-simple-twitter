class TweetsController < ApplicationController
  before_action :authenticate_user!
  def index
    @tweets = Tweet.order(created_at: :desc)
    @uer = @tweets.user
  end
end
