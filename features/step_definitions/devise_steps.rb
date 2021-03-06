require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(locator) { yield } : yield
  end
end
World(WithinHelpers)

Given /^I am not authenticated$/ do
  visit('/tutors/sign_out') # ensure that at least
end

Given /^I am a new, authenticated user$/ do
  first_name = "Salvador"
  last_name = "Villegas"
  sid = 12345678
  email = 'testing@man.net'
  password = 'secretpass'
  Tutor.new(:email => email, :password => password, :password_confirmation => password, :first_name => first_name, :last_name => last_name, :sid => sid, :active => true, :expected_leave_time => Time.now.in_time_zone + 2.days).save!

  visit '/tutors/sign_in'
  fill_in "tutor[sid]", :with => sid
  fill_in "tutor[password]", :with => password
  click_button "tutor-submit"

end