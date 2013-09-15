Rails.application.routes.draw do
  mount Firefly::Engine => "/firefly"
end
