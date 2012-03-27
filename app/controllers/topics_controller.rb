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
    @topic = @user.topics.create(params[:topic])

    if @topic.try(:save)
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "shared/fail_to_create" }
      end
    end
  end

  def reply
    @user = User.find_by_number(current_user.number)
    @topic = Topic.find(params[:id])
    @reply = @topic.replies.create(params[:reply])

    @reply.user = @user

    if @user && @topic && @reply.try(:save)
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "shared/fail_to_reply" }
      end
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.try(:destroy)
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "shared/fail_to_destroy" }
      end
    end
  end
end
