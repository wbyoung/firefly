module Firefly
  class Engine < ::Rails::Engine
    isolate_namespace Firefly
    config.generators do |g|
      g.test_framework      :rspec,        :fixture => false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
      g.assets false
      g.helper false
    end
    initializer "firefly.assets.precompile" do |app|
      app.config.assets.precompile += %w(admin.css admin.js)
    end
  end
end
