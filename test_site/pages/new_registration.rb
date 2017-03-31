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


  def fill_in_new_registration_form
    Faker::Config.locale = 'en-GB'
    first_name.set Faker::Name.first_name
    last_name.set Faker::Name.last_name
    one = first_name.text
    two = last_name
    binding.pry
    day.set '01'
    month.set '01'
    year.set '1979'
    post_code.set 'M60 0AG'
    email.set   "#{one}@mailinator.com"

  sleep 5
  end


end