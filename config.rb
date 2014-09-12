require 'erubis'
require 'lib/snippet_helpers'

activate :directory_indexes
activate :autoprefixer

helpers SnippetHelpers

page "/splash.html", :layout => "splash"

# Add bower's directory to sprockets asset path
after_configuration do
    @bower_config = JSON.parse(IO.read("#{root}/.bowerrc"))
    sprockets.append_path File.join "#{root}", @bower_config["directory"]
end

configure :development do
  activate :livereload
end

set :css_dir, 'stylesheets'
set :images_dir, 'images'
set :js_dir, 'javascripts'

# Build-specific configuration
configure :build do
    # For example, change the Compass output style for deployment
    activate :minify_css
    
    # Minify Javascript on build
    activate :minify_javascript
    
    # Enable cache buster
    # activate :asset_hash
    
    # Use relative URLs
    # activate :relative_assets
    
    # Or use a different image path
    # set :http_prefix, "/Content/images/"
end

# Middleman-deploy Gem settings (https://github.com/tvaughan/middleman-deploy):
activate :deploy do |deploy|
  deploy.method   = :rsync
  deploy.host     = "mistermachineshop.com"
  deploy.path     = "/var/www/rebar"
  deploy.user     = "root"
  # Optional Settings
  # deploy.port  = 5309 # ssh port, default: 22
  # deploy.clean = true # remove orphaned files on remote host, default: false
  # deploy.flags = "-rltgoDvzO --no-p --del -e" # add custom flags, default: -avze
end
