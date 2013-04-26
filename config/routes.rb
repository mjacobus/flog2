Flog::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'albums#index'

  get ':page' => 'albums#index', as: :albums, constraints: { page: /\d+/ }
  get ':category(/:page)' => 'categories#index', as: :category, constraints: { page: /\d+/ }
  get ':category/:album' => 'albums#show', as: :album

end
