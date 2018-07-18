Rails.application.routes.draw do

  resources :posts do
    resources :comments, only: [:create, :destroy]
  end

  get "new_notice" => 'posts#new_notice', as: 'new_post_notice'

  get "edit_notice/:id" => "posts#edit_notice", as: 'edit_post_notice'

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  root "home#index"

  get 'home/index' => 'home#index', as: 'index'

  get 'home/about' => 'home#about', as: 'about'

  get 'home/activities' => 'home#activities', as: 'activities'

  get 'home/recruit' => 'home#recruit', as: 'recruit'

  get 'home/contact' => 'home#contact', as: 'contact'

  get 'home/members' => 'home#members', as: 'members'

  get 'search' => "posts#search", as: 'search'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
