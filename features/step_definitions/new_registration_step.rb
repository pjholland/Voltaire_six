Then(/^the visitor can complete a new registration$/) do
  @test_site.new_registration.fill_in_new_registration_form
end