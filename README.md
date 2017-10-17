# Simple Blog build with RoR.

* Ruby 2.4.2

* Rails 5.1.4

# Basic information:

* Blog has Owner, who can login to Admin Panel by email/password (see seeds.rb).
  Don't forget to do rails db:seed before start.
  
  Users can add Posts and Comments to Posts and Categories, also they can edit Posts
  Owner can do all the same as User but has options to create/delete Categories and delete Posts

* File upload realised with Paperclip gem
  
  Why Paperclip?
  - Because it’s the go-to solution if you just need to upload a file and forget about it. 
  It's also good enough when building   simple APIs since they don't need file caching or processing.
  
  What about CarrierWave?
  - Yeah, this is nice tool. 
  But CarrierWave is usefull for applications that are ‘image heavy’ or have logic associated with files that get uploaded.

* Bootstrap (basic views) been used for frontend

* Just a little things with jQuery and AJAX

# Testing:

* RSpec

* Factrory Girl

* Capybara

* Shoulda Matchers
