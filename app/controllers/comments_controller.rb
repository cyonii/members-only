class CommentsController < ApplicationController
  before_action :set_comment, only: %i[destroy]
  before_action :authenticate_user!

  # POST /comments
  # POST /comments.json
  def create
    @comment = current_user.comments.build(comment_params)
    @comment.post_id = params[:post_id]

    if @comment.save
      flash[:notice] = 'You added comment'
    else
      flash[:alert] = 'Error while adding comment'
    end
    redirect_back(fallback_location: forum_post_path(@comment.post.forum, @comment.post))
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    post = Post.find(params[:post_id])
    flash[:notice] = 'Comment deleted'
    redirect_back(fallback_location: forum_post_path(post.forum, post))
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:text)
  end
end
