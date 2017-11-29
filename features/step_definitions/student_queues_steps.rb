
Given /^"(.*)" "(.*)" is on the wait time page$/ do |first_name, last_name|
  sid = 123456
  steps %Q{
    Given I am on the home page
    Then I fill in "student_first_name" with "#{first_name}"
    And I fill in "student_last_name" with "#{last_name}"
    And I fill in "student_sid" with "#{sid}"
    And I click on "form_submit"
    Then I should be on the wait time page for "#{first_name}" "#{last_name}"
  }
end

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))
end

Given /^"(.*)" "(.*)" is already in line$/ do |first_name, last_name|
  steps %Q{
    Given "#{first_name}" "#{last_name}" is on the wait time page
    And she clicks on "YES"
    Given "#{first_name}" "#{last_name}" is on the wait time page
  }
end

Then /^"(.*)" "(.*)" should( not)? be in line$/ do |first_name, last_name, not_be_in_line|
  student_list = Student.where(:first_name => first_name, :last_name => last_name)
  student_list.should_not be_empty
  student = student_list[0]
  if not_be_in_line
    expect(student.student_requests.find(student.sid).status).to eq("cancelled")
  else
    expect(student.student_requests.find(student.sid).status).to eq("waiting")
  end
end

And /^(?:she|he?) clicks on "(.*)"$/ do |button|
  steps %Q{ When follow "#{button}"}
end


#email confirmation

Given /^I specify "(.*)"$/ do |string|
  pending
end

Given("I pick up a new student") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("no students have been sent emails") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the next student in the queue should receive an email") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("there are three tutors") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("the first two students have been sent emails") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the next student in the queue who hasn't beeen emailed, should receive an email") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("I am a new student") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("there are no students in queue") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("I get an email confirmation") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("two tutors pick up new students") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("the next two students in the queue who haven't been emailed, should receive emails") do
  pending # Write code here that turns the phrase above into concrete actions
end

Given("there are no students in the queue who haven't been emailed") do
  pending # Write code here that turns the phrase above into concrete actions
end

Then("do nothing") do
  pending # Write code here that turns the phrase above into concrete actions
end





