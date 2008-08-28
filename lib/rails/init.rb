[ActionController::Routing::RouteSet].each do |c|
  c.send( :include, RouteNameFor::RouteSetMethods)
end
# Optional, but recommended for Rails
ActionController::Base.send(:include, RouteNameFor::Helpers)
# Include this module into views, too.
ActionController::Base.helper(RouteNameFor::Helpers)