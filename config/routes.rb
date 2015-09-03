class SubdomainPresent
  def self.matches?(request)
    restricted_subdomains = %w{ www admin }
    request.subdomain.present? && !restricted_subdomains.include?(request.subdomain)
  end
end

class SubdomainBlank
  def self.matches?(request)
    request.subdomain.blank?
  end
end

Rails.application.routes.draw do

  devise_for :users, :controllers => {:registrations => "registrations"}
  constraints(SubdomainPresent) do
    root 'posts#index', as: :subdomain_root
    resources :posts
    # devise_scope :user do
    #   get '/sign_in' => "devise/sessions#new"
    #   match '/sign_in', :to => 'devise/sessions#new', via: [:get, :post]
    #   match '/sign_out', :to => 'devise/sessions#destroy', via: [:get, :delete], as: :destroy_user_session
    #   match '/edit', :to => 'devise/registrations#edit', via: [:get, :post]
    #   post  '/password' => "devise/passwords#create"
    #   get    '/password/new' => "devise/passwords#new"
    #   get    '/password/edit' => "devise/passwords#edit"
    #   put    '/password' => "devise/passwords#update"
    # end
  end

  constraints(SubdomainBlank) do
    # devise_scope :user do
    #   get '/register' => "devise/sessions#new"
    #   post  '/register' => 'devise/registrations#new'
    # end
    root 'pages#home'
     get 'pages/about'
    resources :accounts
  end
end