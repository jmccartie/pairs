class CommentsController < ApplicationController

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    @comment.user_id = current_user.id
    @comment.save!

    flash[:notice] = "Successfully created comment."
    redirect_to :back
  end


private

  def find_commentable
    params[:model].classify.constantize.find(params[:id])
  end


end
