Crowdlobbying::Application.routes.draw do

  get "member_causes/index"

  resources :causes do
    resources :members, :controller => "MemberCauses" do
      resources :reports
    end
  end
  
  root :to => 'causes#index'

end
