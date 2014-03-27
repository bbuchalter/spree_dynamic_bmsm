Spree::Core::Engine.routes.draw do

  # Add your extension routes here

  resources :dynamic_bmsm_groups

  resources :dynamic_bmsm_tiers
  namespace :admin do
    resources :dynamic_bmsm_groups do
      collection do
        get 'users'
      end
    end

    resources :dynamic_bmsm_tiers
  end


end
