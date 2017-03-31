require_relative "basepage"

class DashboardPage < SitePrism::Page

  #set_url_matcher /meaningfulplatform.co.uk\/?/

  #individual elements
  element              :tile_panel,                        :css,          '.information-tiles'
  element              :reward_history,                    :css,          '#dashboard-call-to-action-panels > div > div.information-tiles > div > div:nth-child(1) > div > div.information-tile-fixed-height'


end

