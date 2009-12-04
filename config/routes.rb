ActionController::Routing::Routes.draw do |map|


  map.root :controller => "slivers", :action => 'new'

  map.resources :slivers
  map.resources :iterations
 map.biz_credits "biz/credits", :controller => "biz", :action => 'credits'
  map.redirect "/:sliver", :controller => "slivers", :action =>'shadow_display'
  map.redirect "/slivers/:sliver", :controller => "slivers", :action => 'show'

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
