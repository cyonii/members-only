module PostsHelper
  def post_owner_actions(post)
    render('posts/post_owner_actions', post: post) if post_owner(post)
  end

  private

  def post_owner(post)
    user_signed_in? and post.author == current_user
  end
end
