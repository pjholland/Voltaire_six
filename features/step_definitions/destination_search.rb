
Given(/^i am on the last minute home screen$/) do
  @test_site = TestSite.new
  @test_site.home.load
  @test_site.home.text.should include "Most Searched Travel"
end

When(/^i enter Rome into the destination filed$/) do
  @test_site.home.destination_input.set "Rome, Italy"
end

When(/^I click the Search button$/) do
  @test_site.home.destination_search_button.click
end

Then(/^i should see results for Rome$/) do
  @test_site.home.text.should include "hotels for your trip to Rome, Italy"
end

Given(/^I select "(.*?)" from the options menu$/) do |arg1|
  @test_site.home.city_break.click
end

Then(/^i should see the text$/) do
  @test_site.home.text.should include "Most Searched Travel"
end

Given(/^I select the city "(.*?)"$/) do |city|
  @test_site.home.destination_input.set city
end

When(/^I enter my search criteria$/) do
   @test_site.home.select 'Liverpool', :from =>  'departurePoint'
   @test_site.home.select 'Paris', :from =>   'destination'
end

When(/^I click the Search for city break button$/) do
  @test_site.home.city_break_search_button.click
end


