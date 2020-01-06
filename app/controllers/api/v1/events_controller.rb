module Api
  module V1
    class EventsController < ApplicationController
      before_action :authorize_access_request!
      before_action :set_event, only: [:show, :update, :destroy]

      def index
        @events = Event.all
        render json: @events
      end

      def show
        render json: @event
      end

      def create
        @event = Event.new(event_params)
        if @event.save
          render json: @event, status: :created
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      end

      def update
        if @event.update(event_params)
          render json: @event
        else
          render json: @event.errors, status: :unprocessable_entity
        end
      end

      def destroy
        @event.destroy
      end

      private

      def set_event
        @event = Event.find(params[:id])
      end

      def event_params
        params.require(:event).permit(
            :title, :description, :location, :categories, :term_start, :term_end,
            organizer_ids: [], attendee_ids: [])
      end
    end
  end
end
