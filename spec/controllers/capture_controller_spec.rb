require 'spec_helper'

describe Firefly::CaptureController do
  describe 'POST #create' do
    let(:events) do
      [
        { name: 'hi' },
        { name: 'hi', category: 'cat' },
      ]
    end
    
    it 'records events' do
      post :create, use_route: :firefly, format: :json, client_identifier: '123', events: events
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(Firefly::Event.count).to eq(2)
    end

    it 'requires client id' do
      expect { post :create, use_route: :firefly, format: :json, events: events }.to raise_error(ActionController::ParameterMissing)
    end

    it 'requires events' do
      expect { post :create, use_route: :firefly, format: :json, client_identifier: '123' }.to raise_error(ActionController::ParameterMissing)
    end

    it 'requires json' do
      expect { post :create, use_route: :firefly, client_identifier: '123', events: events }.to raise_error(ActionController::RoutingError)
    end
  end
end
