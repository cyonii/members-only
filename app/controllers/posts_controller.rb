class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: %i[show edit update destroy]
  before_action :owner?, only: %i[edit destroy]

  def show
    @comment = Comment.new
  end

  def edit; end

  def create
    @post = current_user.posts.build(post_params)
    @post.forum_id = params[:forum_id]

    if @post.save
      redirect_to forum_post_path(@post.forum, @post), notice: 'Post was successfully created.'
    else
      redirect_back(fallback_location: forum_path(params[:forum_id], error: 'Error while saving.'))
    end
  end

  def update
    if @post.update(post_params)
      redirect_to forum_post_path(@post), notice: 'Post was successfully updated.'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post.destroy
    redirect_to forum_url(params[:forum_id]), notice: 'Post was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:body)
  end

  # Only allow post owner to take action
  def owner?
    return if current_user == @post.author

    flash[:alert] = 'Unauthorized request'
    redirect_back(fallback_location: forum_post_path(@post))
  end
end
