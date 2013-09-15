require_dependency "firefly/application_controller"

module Firefly
  class CaptureController < ApplicationController
    protect_from_forgery :except => [:create]

    def create
      respond_to do |format|
        format.json { render json: _create }
        format.any { raise ActionController::RoutingError.new('Not Found') }
      end
    end

    private

    def _create
      result = {}
      params.require(:events).each do |event|
        Event.create(
          name: event[:name],
          category: event[:category],
          client_id: params.require(:client_identifier))
      end
      result
    end

  end
end
