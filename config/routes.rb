Crowdlobbying::Application.routes.draw do

  get "reports/new"

  get "reports/edit"

  get "member_causes/index"

  resources :causes do
    resources :members, :controller => "MemberCauses" do
      resources :reports
    end
  end
  
  root :to => 'causes#index'

end
