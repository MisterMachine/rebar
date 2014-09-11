require 'erubis'
require 'lib/snippet_helpers'

activate :directory_indexes
activate :autoprefixer

helpers SnippetHelpers

page "/splash.html", :layout => "splash"

# ready do
#   sprockets.append_path 'vendor/stylesheets'
#   sprockets.append_path 'vendor/javascripts'
# end

configure :development do
  activate :livereload
end

set :css_dir, 'stylesheets'
set :images_dir, 'images'
set :js_dir, 'javascripts'

configure :build do
  activate :relative_assets
  set :relative_links, true
end
