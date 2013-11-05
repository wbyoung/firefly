# Firefly [![Build Status](https://secure.travis-ci.org/wbyoung/firefly.png)](http://travis-ci.org/wbyoung/firefly) [![Code Climate](https://codeclimate.com/github/wbyoung/firefly.png)](https://codeclimate.com/github/wbyoung/firefly) [![Coverage Status](https://coveralls.io/repos/wbyoung/firefly/badge.png)](https://coveralls.io/r/wbyoung/firefly)

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
