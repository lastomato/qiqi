class RepliesController < ApplicationController
  before_filter :logged_in?

  def new
    @reply = Reply.new
  end

  def reply
    @user = User.find_by_number(current_user.number)
    @parent = Reply.find(params[:id])
    @child = @parent.child_replies.build(params[:reply])

    @child.user = @user

    if @user && @parent && @child.save
    else
    end
  end

  def destroy
    @reply = Reply.find(params[:id])

    if @reply.try(:destroy)
    else
    end
  end
end
