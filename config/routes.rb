ActionController::Routing::Routes.draw do |map|
  map.resources :invoices, :member => { :preview => :get }
end
