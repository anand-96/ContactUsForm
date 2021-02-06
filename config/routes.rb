Rails.application.routes.draw do
  resources :contacts, only: %w(new)

  root to: "contacts#new"
end
