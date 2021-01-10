module ApplicationHelper
  def right_column
    render 'layouts/right_column' if user_signed_in?
  end

  def left_column
    render 'layouts/left_column' if user_signed_in?
  end

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
end
