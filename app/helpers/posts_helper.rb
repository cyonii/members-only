module PostsHelper
  def gravatar(post)
    alt = post.member.username
    email = post.member.email
    gravatar_image_tag(email, alt: alt, class: 'rounded av-48 mr-3') if member_signed_in?
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
    member_signed_in? and post.member == current_member
  end
end
