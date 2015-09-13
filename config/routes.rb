Nameprint::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :fontsets

  resources :fonts

  resources :projects

  resources :orders do
    post 'to_svg', on: :collection
    post 'import_tsv', on: :collection
  end

  root :to => 'orders#index'
end
