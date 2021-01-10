class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :set_user_data

  def index
    @forums = current_user.forums
    @suggested_forums = Forum.where("user_id != #{current_user.id}").limit(6)
    render template: 'layouts/index'
  end

  private

  def set_user_data
    @comments_received = current_user.comments_received if current_user
  end
end
