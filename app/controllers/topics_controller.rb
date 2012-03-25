class TopicsController < ApplicationController
  before_filter :logged_in?

  def index
    @topics = Topic.desc(:created_at).page.padding(2)
  end

  def new
    @topic = Topic.new
  end

  def create
    @user = User.find_by_number(current_user.number)
    @topic = @user.topics.build(params[:topic])

    if @topic.try(:save)
    else
    end
  end

  def reply
    @user = User.find_by_number(current_user.number)
    @topic = Topic.find(params[:id])
    @reply = @topic.replies.build(params[:reply])

    @reply.user = @user

    if @user && @topic && @reply.try(:save)
    else
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.try(:destroy)
    else
    end
  end
end
