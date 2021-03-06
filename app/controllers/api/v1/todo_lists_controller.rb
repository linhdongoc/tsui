module Api
  module V1
    class TodoListsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_todo_list, only: [:show, :update, :destroy]

      def index
        @todo_lists = TodoList.all
        render json: @todo_lists
      end

      def show
        render json: @todo_list
      end

      def create
        @todo_list = TodoList.new(todo_list_params)
        if @todo_list.save
          render json: @todo_list, status: :created
        else
          render json: @todo_list.errors, status: :unprocessable_entity
        end
      end

      def update
        if @todo_list.update(todo_list_params)
          render json: @todo_list
        else
          render json: @todo_list.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @todo_list.destroy
      end

      private

      def set_todo_list
        @todo_list = TodoList.find(params[:id])
      end

      def todo_list_params
        params.require(:todo_list).permit(:title, item_ids: [])
      end
    end
  end
end
