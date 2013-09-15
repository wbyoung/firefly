# Firefly

To use Firefly in an existing Rails application.

    rake firefly:install:migrations
    rake db:migrate

Update your routes:

    YourApp::Application.routes.draw do
      mount Firefly::Engine => "/firefly"
    end

## Quick deployment to Heroku

Instructions coming soon&hellip;

## License

Firefly is distributed under the MIT-LICENSE.
