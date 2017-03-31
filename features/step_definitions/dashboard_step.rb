Then(/^the dashboard will be visible$/) do
  page.within(@test_site.dashboard.reward_history)do
    page.should have_content 'For you to spend'
  end
end