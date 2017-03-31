require_relative "basepage"

class RegisterPage < SitePrism::Page
  set_url "https://member-portal.qa.meaningfulplatform.co.uk/register"
  set_url_matcher /meaningfulplatform.co.uk\/?/

  #individual elements
  element              :registration_options,                        :id,          'register-check-card-form'


  #clection of elements
  elements            :other_thingy,                                'other.thingy'


  #sections
  sections            :nonexistent_section, NoElementWithinSection,  'input#nonexistent'

end