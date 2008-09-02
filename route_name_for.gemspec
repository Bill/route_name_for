Gem::Specification.new do |s|
  s.name = %q{route_name_for}
  s.version = "0.0.3"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bill Burcham"]
  s.date = %q{2008-09-01}
  s.description = %q{Rails helper to look up (named) route name given current request URI. Adds route_name_for method to controllers and views.}
  s.email = ["propeller@thoughtpropulsion.com"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "website/index.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "PostInstall.txt", "README.txt", "Rakefile", "config/hoe.rb", "config/requirements.rb", "lib/init.rb", "lib/rails/init.rb", "lib/route_name_for.rb", "lib/route_name_for/version.rb", "route_name_for.gemspec", "script/console", "script/destroy", "script/generate", "script/txt2html", "setup.rb", "tasks/deployment.rake", "tasks/environment.rake", "tasks/website.rake", "test/test_helper.rb", "test/test_route_name_for.rb", "website/index.html", "website/index.txt", "website/javascripts/rounded_corners_lite.inc.js", "website/stylesheets/screen.css", "website/template.html.erb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Bill/route_name_for/tree/master}
  s.post_install_message = %q{
For more information on route_name_for, see http://github.com/Bill/route_name_for/tree/master
}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{route_name_for}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{description of gem}
  s.test_files = ["test/test_helper.rb", "test/test_route_name_for.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
