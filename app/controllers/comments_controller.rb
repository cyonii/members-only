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
    redirect_to post_path(@comment.post)
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy

    flash[:notice] = 'Comment deleted'
    redirect_to post_path(id: params[:post_id])
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
