Firefly::Engine.routes.draw do
  scope 'api' do
    scope 'v1' do
      post '/capture', to: 'capture#create'
    end
  end
end
