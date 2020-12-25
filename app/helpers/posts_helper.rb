module PostsHelper
  def member_profile
    return 'devise/shared/member_card' if member_signed_in?

    'devise/shared/auth'
  end

  def gravatar(post)
    alt = post.member.username
    email = post.member.email
    gravatar_image_tag(email, alt: alt, class: 'rounded-circle av-48') if member_signed_in?
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

  def members_list
    render 'devise/shared/members' if member_signed_in? and @members
  end

  def member_header
    render 'posts/member_header' if member_signed_in?
  end

  def post_owner_actions(post)
    render('posts/post_owner_actions', post: post) if post_owner(post)
  end

  private

  def post_owner(post)
    member_signed_in? and post.member == current_member
  end
end
