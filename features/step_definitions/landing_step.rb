Given(/^the visitor is on the landing page$/) do
  @test_site = TestSite.new
  @test_site.landing.load
end
