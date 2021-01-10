class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_user_data

  def index
    render template: 'layouts/index'
  end

  private

  def set_user_data
    @forums = current_user.forums if current_user
    @comments_received = current_user.comments_received
    @suggested_forums = Forum.where("user_id != #{current_user.id}").limit(6)
  end
end
