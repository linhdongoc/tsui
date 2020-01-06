class HomeController < ApplicationController
  def index
    @books = current_user.books.all
    render json: @books
  end
end
