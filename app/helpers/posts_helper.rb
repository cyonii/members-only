module PostsHelper
  def gravatar(user, extra_class = nil)
    alt = user.username
    email = user.email
    css_class = 'rounded'
    css_class += " #{extra_class}" if extra_class

    gravatar_image_tag(email, alt: alt, class: css_class) if user_signed_in?
  end

  def flash_message
    render 'posts/flash' if flash.present?
  end

  def flash_class
    return 'success' if flash[:notice]
    return 'danger' if flash[:alert]
  end

  def form_errors
    render 'posts/form_errors' if @post.errors.any?
  end

  def user_profile_card
    return 'devise/shared/user_profile_card' if user_signed_in?

    'devise/shared/auth'
  end

  def users_list
    render 'devise/shared/users_list' if user_signed_in? and @users
  end

  def post_user_header
    render 'posts/post_user_header' if user_signed_in?
  end

  def post_owner_actions(post)
    render('posts/post_owner_actions', post: post) if post_owner(post)
  end

  private

  def post_owner(post)
    user_signed_in? and post.author == current_user
  end
end
