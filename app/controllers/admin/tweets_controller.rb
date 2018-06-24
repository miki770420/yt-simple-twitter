class Admin::TweetsController < ApplicationController
before_action :authenticate_user!
before_action :authenticate_admin
  def index
    @tweets = Tweet.order(created_at: :desc)
    @tweet = Tweet.new
  end

private 
  def authenticate_admin
      unless current_user.admin?
        flash[:alert] = "Not allow!"
        redirect_to root_path
      end
  end
  
end
