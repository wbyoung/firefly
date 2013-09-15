Firefly::Engine.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      post '/capture', to: 'capture#create'
    end
  end
end
