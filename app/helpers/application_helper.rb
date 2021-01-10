module ApplicationHelper
  def right_column
    render 'layouts/right_column' if user_signed_in?
  end

  def left_column
    render 'layouts/left_column' if user_signed_in? and @forums
  end
end
