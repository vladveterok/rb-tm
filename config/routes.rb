Rails.application.routes.draw do
  resources :tasks, only: [:index, :create, :show, :edit, :update, :destroy] do
    post :toggle, on: :member
    collection do
      patch :sort
    end
  end
  resources :projects
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: redirect('projects')
  get 'count', to: 'projects#count_projects'
end
