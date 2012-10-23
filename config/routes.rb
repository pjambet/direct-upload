DirectUpload::Application.routes.draw do
  resources :signed_url, only: :index

  resources :photos

  root to: "photos#index"
end
