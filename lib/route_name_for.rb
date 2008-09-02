$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module RouteNameFor

  module RouteSetMethods
    def recognized_route( path, env)
      recognized_route_optimized( path, env)
    end

    def recognized_route_optimized( path, env)
      write_recognized_route_optimized( path, env)
      recognized_route_optimized(path, env)
    end

    def write_recognized_route_optimized( path, env)
      # This does a reverse-lookup to find the named route (name) from the current
      # controller and action. The is preferrable to just munging the controller name since often
      # your named routes (names) evolve somewhat independently of your controller names over time.
      # See write_recognize_optimized in Rails' recognition_optimisation.rb (sic) (that's where I stole)
      # this code from. It's important to steal this optimized (dynamically-compiled) code lest
      # we defeat the Rails optimization.

      tree = segment_tree(routes)
      body = generate_code(tree)
      instance_eval %{
        def recognized_route_optimized(path, env)
          segments = to_plain_segments(path)
          index = #{body}
          return nil unless index
          while index < routes.size
            routes[index].recognize(path, env) and return routes[index]
            index += 1
          end
          nil
        end
      }, __FILE__, __LINE__
    end
  end

  module Helpers
    def route_name_for( path, env)
      r = ActionController::Routing::Routes.recognized_route( path, env)
      ActionController::Routing::Routes.named_routes.routes.invert[r].to_s
    end
  end

end

[ActionController::Routing::RouteSet].each do |c|
  c.send( :include, RouteNameFor::RouteSetMethods)
end
# Optional, but recommended for Rails
ActionController::Base.send(:include, RouteNameFor::Helpers)
# Include this module into views, too.
ActionController::Base.helper(RouteNameFor::Helpers)