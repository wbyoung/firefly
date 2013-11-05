require "firefly/engine"

module Firefly

  # Authentication method name used by before filter for protected actions
  mattr_accessor :authentication_method
  @@authentication_method = nil

  # Current user method name
  mattr_accessor :current_user_method
  @@current_user_method = nil

  # Setup method for Firefly. Run `rails generate firefly:install` to create
  # a fresh initializer with all configuration values.
  def self.setup
    yield self
  end

end
