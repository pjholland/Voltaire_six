require_relative "basepage"

class NewRegistrationPage < SitePrism::Page

  set_url_matcher /meaningfulplatform.co.uk\/?/

  #individual elements
  element              :gender_type,                          :id,          'member-title'
  element              :first_name,                           :id,          'member-first-name'
  element              :last_name,                            :id,          'member-last-name'
  element              :day,                                  :id,          'member-day-of-birth'
  element              :month,                                :id,          'member-month-of-birth'
  element              :year,                                 :id,          'member-year-of-birth'
  element              :post_code,                            :id,          'postcode'
  element              :email,                                :id,          'member-email'
  element              :confirm_email,                        :id,          'member-confirm-email'
  element              :password,                             :id,          'member-password'
  element              :confirm_password,                     :id,          'member-confirm-password'
  element              :continue_to_payment_button,           :id,          'register-button'
  element              :copy_address_button,                  :id,          'find-address-current'
  element              :address_results_list,                 :id,          'postcode-search-results-placeholder'
  element              :first_item_from_address_list,         :css,          '#postcode-search-results-placeholder > ul > li:nth-child(1)'


  def fill_in_new_registration_form
    Faker::Config.locale = 'en-GB'
    gender_type.select('Mr')
    one = first_name.set Faker::Name.first_name
    two = last_name.set Faker::Name.last_name
    three = one.value
    four = two.value
    day.set '01'
    month.set '01'
    year.set '1979'
    post_code.set 'M60 0AG'
    member_email = email.set   "#{three.downcase}#{four.downcase}@mailinator.com"
    confirm_email.set   "#{three.downcase}#{four.downcase}@mailinator.com"
    puts member_email.value
    post_code.set 'W22TB'
    copy_address_button.click
    first_item_from_address_list.click
    password.set 'M3mbership'
    confirm_password.set 'M3mbership'
    continue_to_payment_button.click
  end


end