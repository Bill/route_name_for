$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module RouteNameFor
  
  def route_name_for( options)
    # This does a reverse-lookup to find the named route (name) from the current
    # controller and action. The is preferrable to just munging the controller name since often
    # your named routes (names) evolve somewhat independently of your controller names over time.
    routes = ActionController::Routing::Routes.named_routes.routes
    found = routes.find do |route_name, route|
      route.generate( options, options) # ignore "recall" issues (see Rails route_set.rb)
    end
    (found && found[0]) || ''
  end
end

# Properly, we should be extending ActionView::Helpers::UrlHelper, however we are loaded too late
# to do that. By the time we are loaded ActionView has already extended ActionView::Base with all
# its helper modules. So we have to just settle for adding ourselves directly to ActionView::Base.
[ActionController::Base, ActionView::Base].each do |c|
  c.send( :include, RouteNameFor)
end