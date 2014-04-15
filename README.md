

SpreeDynamicBmsm
================

Spree Synamic Buy More Save More Promotion Management system. 

Users belong to a bmsm group and so do tiers

Tiers define the minimum level ($ amount) of an order that a discount (e.g, 10%) applies to.
Multiple tiers within a group define the changes in discount as an order reaches new levels.


Example
=======
In a group there might be three tiers defined in the following way.

level:100, 10%

level:150, 15% 

level:200, 20%

So an order with a total of $125 would get a 10% discount while $175 would get 15%, and a $225 order would get %20

Install
================

Add to Gemfile:
`gem 'spree_dynamic_bmsm'`
and bundle

 Then install the extension to your spree store by running `rails g spree_simple_sales:install`

Then run migrations if you didnt already run them from the extension installed:
`bundle exec rake db:migrate`

Admin - getting started
================
Go to spree /admin. There should be a new top menu called BMSM.

The link takes you to Tiers which should be empty

Click on the Groups link which takes you to the groups page.

click on new group and create new groups

click back to tiers and create tiers belonging to the groups created..


Promotions
================

Go to spree /admin/promotions. Create a new promotion as you normally would.

In the rules types dropdown there will be a new rule called Buy More Save More. Add it and update the promnotion.

Add a new adjustment action. In the calculator dropdown you will find a Buy More Save More calculator. Choose it and update.

Users
================
`spree_users` has a new column called `dynamic_bmsm_group_id` by default it is null.

`Spree::User` now has two new methods:

You can use these methods to update users with groups.

for example in `Spree::UserRegistrationsController` you can have an `after_filter` that sets the new users group to a random group(as described above).  TODO:Add a `UserRegistrationsController` decorator with an after filter that does just that.

Back in `admin/dynamic_bmsm_groups` there is a link called `Users` in the group list. clicking on that shows you the users belonging to that group. A user's group can be changed by picking a new group from the dropdown and clicking submit.


Testing
================
Testing not built yet.
...
Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

    $ bundle
    $ bundle exec rake test_app
    $ bundle exec rspec spec

Copyright (c) 2014 [urimikhli@gmail.com], released under the New BSD License
