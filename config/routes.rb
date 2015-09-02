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

  devise_for :users
  constraints(SubdomainPresent) do
    root 'posts#index', as: :subdomain_root
    resources :posts
  end

  constraints(SubdomainBlank) do
    root 'pages#home'
     get 'pages/about'
    resources :accounts
  end
end