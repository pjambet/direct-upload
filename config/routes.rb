DirectUpload::Application.routes.draw do
  resources :signed_urls, only: :index

  resources :photos

  root to: "photos#index"
end
