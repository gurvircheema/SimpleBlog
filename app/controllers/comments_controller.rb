class CommentsController < ApplicationController
  def create
    @posting = Posting.find(params[:posting_id])
    @comment = @posting.comments.build[comment_params]
    @posting.save
    redirect_to @posting
  end
  
  private
  def comment_params
    params.require(:comment).permit(:body, :posting_id)
  end
end
