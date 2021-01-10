class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_forums

  def index
    @comments_received = current_user.comments_received
    @suggested_forums = Forum.where("user_id != #{current_user.id}").limit(6)
    render template: 'layouts/index'
  end

  private

  def set_forums
    @forums = current_user.forums if current_user
  end
end
