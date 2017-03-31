require_relative "basepage"

class RegisterPage < SitePrism::Page
  set_url "https://member-portal.qa.meaningfulplatform.co.uk/register"
  set_url_matcher /meaningfulplatform.co.uk\/?/

  #individual elements
  element              :email,                        :id,          'member-email'
  element              :password,                     :id,          'member-password'
  element              :sign_in_button,               :class,       'btn-primary'

  #clection of elements
  elements            :other_thingy,                                'other.thingy'


  #sections
  sections            :nonexistent_section, NoElementWithinSection,  'input#nonexistent'

end