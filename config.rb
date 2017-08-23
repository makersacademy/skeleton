activate :dotenv

Dir["lib/*.rb"].each { |file| require file }

###
# Compass
###

activate :directory_indexes
activate :meta_tags

set :url_root, 'http://www.makersacademy.com'
activate :search_engine_sitemap

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
helpers CurrentPageHelper,
        MarkdownHelper,
        PossessiveHelper,
        SlugHelper,
        ImageHelper,
        GraduatesHelper,
        RawHelper,
        StatsHelper,
        BooleanHelper

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
data.example_dataset.each do | example |
  if example[:case_study]
    url_slug = graduate_slug(example)
    proxy "/example-dynamic-pages/#{url_slug}.html", "/example-dynamic-pages/template.html", locals: { example: example }, ignore: true
  end
end

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :partials_dir, 'partials'
set :images_dir, 'images'

sprockets.append_path File.join root, 'bower_components'

set :apply_url, "/apply"
set :onsite_application_form_url, "http://apply.makersacademy.com"
set :remote_application_form_url, "http://apply.makersacademy.com/remote/application"
set :precourse_beta_application_form_url, "http://apply.makersacademy.com/precourse-beta/application"

configure :development do
  activate :livereload
  set :segment_key, 'fjB2Afsk8U7NNgugtKdte88HGNXk3yr7'

  # custom setting for switching off analytics in development
  set :run_analytics, false

  set :employers_form_endpoint, 'https://formkeep.com/f/b95fcb2be128'

  # turn on to view a baseline grid for setting vertical rhythm
  set :show_baseline_grid, false
end

# Build-specific configuration
configure :build do

  activate :imageoptim do |options|
    options.pngout    = false
    options.svgo      = false
  end

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

  set :run_analytics, true

  set :segment_key, ENV.fetch('SEGMENT_KEY', '8NGMT5SwWiR5BvuyrpTsirX9XY8CeZ4R')

  set :employers_form_endpoint, 'https://formkeep.com/f/1ae1f30c4bcf'

  set :show_baseline_grid, false

  #Filewatcher ignore list
  set :file_watcher_ignore,[
      /^bin(\/|$)/,
      /^\.bundle(\/|$)/,
  #   /^vendor(\/|$)/,
      /^node_modules(\/|$)/,
      /^\.sass-cache(\/|$)/,
      /^\.cache(\/|$)/,
      /^\.git(\/|$)/,
      /^\.gitignore$/,
      /\.DS_Store/,
      /^\.rbenv-.*$/,
      /^Gemfile$/,
      /^Gemfile\.lock$/,
      /~$/,
      /(^|\/)\.?#/,
      /^tmp\//
    ]
end
