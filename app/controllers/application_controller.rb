class ApplicationController < ActionController::Base
  before_action :set_users

  private

  def set_users
    @users = User.all
  end
end
