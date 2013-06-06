class CommentsController < ApplicationController
  before_filter :require_login

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to :back, notice: "Successfully created comment."
    else
      redirect_to :back, alert: "Comment could not be saved: #{@comment.errors.full_messages.first}"
    end
  end

  def destroy
    @comment = current_user.comments.find(params[:id])
    authorize! :destroy, @comment
    @comment.destroy

    redirect_to :back, notice: "Comment removed."
  end


private

  def find_commentable
    params[:commentable_type].classify.constantize.find(params[:commentable_id])
  end


end
