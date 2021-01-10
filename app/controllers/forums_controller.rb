class ForumsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_forum, only: %i[show edit update destroy]

  def index
    # @forums = Forum.all
  end

  def show
    @post = Post.new(forum: @forum)
  end

  def new
    @forum = Forum.new
  end

  def edit; end

  def create
    @forum = Forum.new(forum_params)

    if @forum.save
      redirect_to @forum, notice: 'Forum was successfully created.'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    if @forum.update(forum_params)
      redirect_to @forum, notice: 'Forum was successfully updated.'
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @forum.destroy
    redirect_to forums_url, notice: 'Forum was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_forum
    @forum = Forum.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def forum_params
    params.require(:forum).permit(:name, :description, :user_id)
  end
end
