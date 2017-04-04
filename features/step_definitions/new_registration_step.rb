Then(/^the visitor can complete a new registration$/) do
  @test_site.new_registration.fill_in_new_registration_form
  sleep 3
  binding.pry
  frame = page.find(:css, 'iframe.gw-proxy-number')
  page.driver.browser.switch_to.frame(frame)
  #@test_site.card_payment.card_number.set '123'
end