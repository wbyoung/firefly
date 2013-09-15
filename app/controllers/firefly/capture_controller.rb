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

    def _find_or_create_from_events(model, name_key)
      names = params.require(:events).map { |event| event[name_key] }.select { |name| name }
      result = model.where(name: names).inject({}) { |h, v| h[v.name] = v; h }
      names.each do |name| # ensure all exist
        result[name] = model.find_or_create_by(name: name) unless result[name]
      end
      result
    end

    def _create
      result = {}
      bundle = Bundle.find_or_create_by(name: params.require(:bundle_identifier))
      client = Client.find_or_create_by(name: params.require(:client_identifier))
      kinds = _find_or_create_from_events Kind, 'name'
      categories = _find_or_create_from_events Category, 'category'

      params.require(:events).each do |event|
        Event.create(kind: kinds[event[:name]], category: categories[event[:category]], bundle: bundle, client: client)
      end
      result
    end

  end
end
