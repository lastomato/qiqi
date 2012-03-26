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
<<<<<<< HEAD
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "shared/fail_to_reply" }
      end
=======
    else
>>>>>>> a7b7f2d06edb2e5708607ecada84a371ac29506f
    end
  end

  def destroy
    @reply = Reply.find(params[:id])

    if @reply.try(:destroy)
<<<<<<< HEAD
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js { render "shared/fail_to_destroy" }
      end
=======
    else
>>>>>>> a7b7f2d06edb2e5708607ecada84a371ac29506f
    end
  end
end
