Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :show, :edit, :update, :destroy] do
    post :toggle, on: :member
  end
  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('projects')
end
