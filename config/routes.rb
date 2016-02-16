Rails.application.routes.draw do
  get 'login/lender'
  get 'login/borrower'

  root 'sessions#new'
  post 'users/lender' => 'lenders#create'
  post 'users/borrower' => 'borrowers#create'
  get '/logout' => 'sessions#logout'
  get '/already' => 'sessions#login'
  get '/lender/:id' => 'lenders#index'
  get '/borrower/:id' => 'borrowers#index'
  get 'sessions/new'
  post '/sessions' => 'sessions#create'
  get '/lend/:bid/:uid' => 'lenders#lend'
  get 'sessions/create'

  get 'sessions/logout'

  get 'borrowers/index'

  get 'borrowers/create'

  get 'lenders/index'

  get 'lenders/create'

 
end
