Conflagration::Application.routes.draw do
  post "/logins", :to => "logins#create"
  root :to => "logins#new"
  get ":room(.:format)", :to => "messages#index"
  post ":room(.:format)", :to => "messages#create"
end
