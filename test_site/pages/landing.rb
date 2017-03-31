require_relative "basepage"

class LandingPage < SitePrism::Page

  set_url "https://member-portal.qa.meaningfulplatform.co.uk/"
  set_url_matcher /meaningfulplatform.co.uk\/?/

  #individual elements
  element              :go_to_signin,                          :css,          'body > ul > li:nth-child(1) > a'
  element              :go_to_register,                        :css,           'body > ul > li:nth-child(2) > a'
  element              :go_to_new_registration,                :css,         'body > ul > li:nth-child(3) > a'
  element              :go_to_colleague_registration,          :css,         'body > ul > li:nth-child(4) > a'
  element              :go_to_temporary_card,                  :css,         'body > ul > li:nth-child(5) > a'



end