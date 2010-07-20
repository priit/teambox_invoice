ActionController::Routing::Routes.draw do |map|
  #TODO figure out how to add new routes to master route such as /projects/1/invoices etc
  map.resources :invoices, :member => { :preview => :get }
end
