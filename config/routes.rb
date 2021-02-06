Rails.application.routes.draw do
  resources :contacts, only: %w(new create)

  root to: "contacts#new"

  get '*path', to: redirect('/404.html')
end
