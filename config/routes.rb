Firefly::Engine.routes.draw do
  post '/capture', to: 'capture#create'
end
