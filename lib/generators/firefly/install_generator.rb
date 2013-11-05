module Firefly
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Creates a Firefly initializer for your application."
      source_root File.expand_path("../templates", __FILE__)
      argument :name, :type => :string, :default => "User"

      def copy_initializer
        @underscored_user_name = name.underscore
        template "firefly.rb.erb", "config/initializers/firefly.rb"
      end
    end
  end
end
