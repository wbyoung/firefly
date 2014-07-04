require 'spec_helper'

describe Firefly::CaptureController do
  describe 'POST #create' do
    let(:acceptable_params) {{
      use_route: :firefly, format: :json, client_identifier: '123', bundle_identifier: 'com.fadingred.MyApp', events: [
        { name: 'hi' },
        { name: 'hi', category: 'cat' },
      ]
    }}

    it 'records events' do
      post :create, acceptable_params
      expect(response).to be_success
      expect(response.status).to eq(200)
      expect(Firefly::Event.count).to eq(2)
    end

    it 'records events with the same name/category when posted multiple times' do
      post :create, acceptable_params
      post :create, acceptable_params
      expect(Firefly::Event.count).to eq(4)
    end

    it 'requires client id' do
      params = acceptable_params
      params.delete(:client_identifier)
      expect { post :create, params }.to raise_error(ActionController::ParameterMissing)
    end

    it 'requires bundle id' do
      params = acceptable_params
      params.delete(:bundle_identifier)
      expect { post :create, params }.to raise_error(ActionController::ParameterMissing)
    end

    it 'accepts bundle id via environment variable' do
      Firefly::FIREFLY_DEFAULT_BUNDLE_ID = 'com.fadingred.firefly'
      params = acceptable_params
      params.delete(:bundle_identifier)
      expect { post :create, params }.not_to raise_error
      Firefly.send(:remove_const, :FIREFLY_DEFAULT_BUNDLE_ID)
    end

    it 'requires events' do
      params = acceptable_params
      params.delete(:events)
      expect { post :create, params }.to raise_error(ActionController::ParameterMissing)
    end

    it 'requires json' do
      params = acceptable_params
      params.delete(:format)
      expect { post :create, params }.to raise_error(ActionController::RoutingError)
    end
  end
end
