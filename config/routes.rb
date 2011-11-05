Crowdlobbying::Application.routes.draw do

  get "member_causes/index"

  resources :causes do
    resources :members, :controller => "MemberCauses"
  end
  
  root :to => 'causes#index'

end
