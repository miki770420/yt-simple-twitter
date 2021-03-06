class RepliesController < ApplicationController
  def index
    @tweet = Tweet.find(params[:tweet_id])
    @replies = @tweet.replies.order(created_at: :desc)
    @reply = Reply.new
  end

  def create
    @tweet = Tweet.find(params[:tweet_id])
    @reply = @tweet.replies.build(reply_params)
    @reply.user = current_user
    @reply.save!
    redirect_back(fallback_location: root_path)
  end

  private
  def reply_params
    params.require(:reply).permit(:comment)
  end
end
