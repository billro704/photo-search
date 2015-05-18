PhotoSearch::Application.routes.draw do
  get "home/index"
  root "search#index"
end
