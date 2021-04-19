Rails.application.routes.draw do
  resources :users, only: [:create] do
    collection do
      get :sign_up, action: 'new'
    end
  end

  resources :sessions, path: 'users', only: [] do  # path指說前面網址長這樣
    collection do
      get :sign_in, action: 'new'  # get :sign_in是說這個頁面是這網址
      post :sign_in, action: 'create'
      delete :sign_out, action: 'destroy'
    end
  end

  resources :restaurants
  root 'restaurants#index'
end
