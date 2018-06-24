class UsersController < ApplicationController
  def show
    @tweeted_tweets = current_user.tweets.order(created_at: :desc)
  end
end
