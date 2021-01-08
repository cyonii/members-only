module PostsHelper
  def gravatar(member, extra_class = nil)
    alt = member.username
    email = member.email
    css_class = 'rounded'
    css_class += " #{extra_class}" if extra_class

    gravatar_image_tag(email, alt: alt, class: css_class) if member_signed_in?
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

  def member_profile_card
    return 'devise/shared/member_profile_card' if member_signed_in?

    'devise/shared/auth'
  end

  def members_list
    render 'devise/shared/members_list' if member_signed_in? and @members
  end

  def post_member_header
    render 'posts/post_member_header' if member_signed_in?
  end

  def post_owner_actions(post)
    render('posts/post_owner_actions', post: post) if post_owner(post)
  end

  private

  def post_owner(post)
    member_signed_in? and post.author == current_member
  end
end
