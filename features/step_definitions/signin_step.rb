Given(/^the visitor goes to the "([^"]*)" page$/) do |page|
  if page == "sign in"
    @test_site.landing.go_to_signin.click
  end
  if page == "register"
    @test_site.landing.go_to_register.click
  end
  if page == "new registration"
    @test_site.landing.go_to_new_registration.click
  end
end

When(/^the visitor signs in as an existing member$/) do
  @test_site.signin.email.set 'MembershipQATester+1031@gmail.com'
  @test_site.signin.password.set 'M3mbership'
  @test_site.signin.sign_in_button.click
end



