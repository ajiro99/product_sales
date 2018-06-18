Rails.application.routes.draw do
  resources :sales
  resources :stockings
  resources :bodies, excpt: %i(show)
  resources :lenses, excpt: %i(show)
end
