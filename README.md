Internal RAGNARSON Interview Refactor App
=========================================

Basic JSON API - Collection of TvShows watched by users

How to run locally
------------------

1. Install ruby
2. Install gems:
   `$ bundle install`
3. Check if all tests pass:
   `$ bundle exec rspec`

How to contribute new code/changes/fixes
----------------------------------

1. Develop on own copy (private), branch based on master (github, bitbucket, or any other git repository)
2. When finished do not create PR, just grand access to one of our seniors to your changes from your repos (info with nickname will be sent to you via mail)
3. Inform us that code is ready to check

TODO:
-----

* Extend in a way you like
* Refactor what you don't like
* Spend as much as 2 hours, things you didn't finish in time write down in README and we'll discuss those during the interview. It is more important to show that you understand the application and problems contained in it, rather than implementing all solutions in the application code itself.

1. Add gem serializer
2. Add api/v1/ namespace to routing, controllers and tests
3. Add gem 'friendly_id' and change id inside url to pretty url
4. Change update and delete actions in tv shows controller by adding current_user.tv_shows.find(params[:id]) and change tests for this action if You need to limit this action only for user which created it
5. Add indexes to migration, faster when create migration like t.references :tv_shows, index: true, foreign_key: true
6. Add API errors handle
