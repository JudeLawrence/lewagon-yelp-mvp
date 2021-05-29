Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root 'restaurants#index'

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: :destroy do
    resources :answers, only: [:new, :create]
  end

  resources :answers, only: :destroy

end

# resources :gardens do
#   resources :plants, only: [:new, :create]
# end
# resources :plants, only: :destroy
