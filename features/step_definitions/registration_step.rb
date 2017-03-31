Then(/^the visitor will see the available registration options$/) do
  page.within(@test_site.register.registration_options)do
    page.should have_content 'Do you have a plastic or paper Co‑op card or key fob?'
  end
end