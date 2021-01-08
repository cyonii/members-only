class ApplicationController < ActionController::Base
  before_action :set_members

  private

  def set_members
    @members = Member.all
  end
end
