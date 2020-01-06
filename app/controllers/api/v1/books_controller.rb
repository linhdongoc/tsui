module Api
  module V1
    class BooksController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_book, only: [:show, :update, :destroy]

      def index
        @books = current_user.books.all
        render json: @books
      end

      def show
        render json: @book
      end

      def create
        @book = current_user.books.build(book_params)
        if @book.save
          render json: @book, status: :created
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      def update
        if @book.update(book_params)
          render json: @book
        else
          render json: @book.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @book.destroy
      end

      private

      def set_book
        @book = current_user.books.find(params[:id])
      end

      def book_params
        params.require(:book).permit(:title)
      end
    end
  end
end
