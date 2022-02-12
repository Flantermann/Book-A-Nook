class BookmarksController < ApplicationController

  before_action :set_space, only: [:create, :destroy]

  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    @bookmark = Bookmark.new
    @bookmark.space = @space
    @bookmark.user = current_user
    if @bookmark.save
      redirect_to space_path(params[:space_id])
    else
      render "spaces/show"
    end
  end

  def destroy
    @bookmark = Bookmark.find_by(user: current_user, space: @space)
    @bookmark.destroy
    redirect_to space_path(params[:space_id])
  end

  private

  def set_space
    @space = Space.find(params[:space_id])
  end
end
