require_relative "basepage"

class TestHomePage < SitePrism::Page
  set_url "http://www.lastminute.com"
 #set_url_matcher /lastminute.com\/?/

  #individual elements
  element              :destination_search_button,    :id,          'hotels_submit'
  element              :city_break,                   :id,          'is_link_city_breaks'
  element              :city_break_search_button,     :id,          'dp_submit'
  element              :city_break_destination,       :id,          'departurePoint'
  element              :going_to_destination,         :id,          'destination'
  element              :destination_input,            :id,          'city'
  element              :welcome_header,               :xpath,       '//h1'
  element              :welcome_message,              :xpath,       '//span'
  element              :go_button,                    :xpath,       '//input'
  element              :link_to_search_page,          :xpath,       '//a'
  element              :some_slow_element,            :xpath,       '//a[@class="slow"]'
  element              :invisible_element,                          'input.invisible'
  elements             :lots_of_links,                :xpath,       '//td//a'
  elements             :nonexistent_elements,                       'input#nonexistent'
  elements             :city_break_destination,                     "//select[@id = 'departurePoint']/option[@value = 'Paris']"

  #elements that should not exist
  element             :squirrel,                                    'squirrel.nutz'
  element             :other_thingy,                                'other.thingy'

  #sections
  section             :people, People,                               '.people'
  section             :container_with_element, ContainerWithElement, '#container_with_element'
  section             :nonexistent_section, NoElementWithinSection,  'input#nonexistent'
  sections            :nonexistent_section, NoElementWithinSection,  'input#nonexistent'

end

