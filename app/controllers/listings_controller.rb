class ListingsController < ApplicationController
  def index
    @listings = current_user.spaces
  end
end
