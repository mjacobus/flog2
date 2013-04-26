Flog::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'albums#index'

  get ':page' => 'albums#index', as: :albums
  get ':category/:album' => 'albums#show', as: :album
end
