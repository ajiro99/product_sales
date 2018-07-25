Rails.application.routes.draw do
  resources :sales
  resources :stockings
  resources :bodies, excpt: %i(show)
  resources :lenses, excpt: %i(show)
  resources :stocking_products, only: %i(index)
  get 'sales_search', to: 'sales#search'
end
